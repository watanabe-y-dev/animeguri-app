# 観光スポット情報：Firestore用フィールド・型 初期案（タスク2メモ）

| フィールド名 | 型        | 必須 | 説明                   | 備考例                     |
| ------------ | --------- | ---- | ---------------------- | -------------------------- |
| id           | string    | ○    | ドキュメントID         | Firestore自動生成/指定可   |
| name         | string    | ○    | 名称                   |                            |
| description  | string    |      | 説明                   |                            |
| location     | geopoint  | ○    | 位置情報（緯度・経度） | FirestoreのGeoPoint型      |
| imageUrls    | array     |      | 画像URLリスト          | 複数画像対応               |
| category     | string    |      | カテゴリ               | 例：自然、歴史、グルメ等   |
| address      | string    |      | 住所                   |                            |
| openingHours | map       |      | 営業時間               | 曜日ごとなど柔軟に拡張可能 |
| tags         | array     |      | タグ                   | 検索・分類用               |
| createdAt    | timestamp | ○    | 作成日時               | サーバータイムスタンプ推奨 |
| updatedAt    | timestamp |      | 更新日時               |                            |
| isPublished  | boolean   |      | 公開フラグ             |                            |

---

## 設計意図・補足
- **id**: FirestoreのドキュメントIDとして利用。自動生成または指定可。
- **location**: FirestoreのGeoPoint型を利用し、緯度・経度で保存。
- **imageUrls**: 画像が複数ある場合も考慮し配列型。
- **openingHours**: map型で柔軟に表現（例：曜日ごと、特別営業日など）。
- **createdAt/updatedAt**: Firestoreのサーバータイムスタンプ推奨。
- **isPublished**: 下書き・非公開管理用。

今後の要件追加や運用でフィールド追加・型変更の可能性あり。

# タスク2メモ：観光スポット（聖地）・アニメ情報のFirestore設計案

## 1. アニメ情報コレクション（anime）
| フィールド名 | 型        | 必須 | 説明                 | 備考例                     |
| ------------ | --------- | ---- | -------------------- | -------------------------- |
| id           | string    | ○    | ドキュメントID       | Firestore自動生成/指定可   |
| title        | string    | ○    | アニメタイトル       |                            |
| description  | string    |      | 説明                 |                            |
| startYear    | number    |      | 放送開始年           |                            |
| endYear      | number    |      | 放送終了年           |                            |
| officialSite | string    |      | 公式サイトURL        |                            |
| imageUrl     | string    |      | 代表画像URL          |                            |
| spotIds      | array     |      | 関連スポットIDリスト | spotsコレクションのid配列  |
| createdAt    | timestamp | ○    | 作成日時             | サーバータイムスタンプ推奨 |
| updatedAt    | timestamp |      | 更新日時             |                            |

## 2. 聖地情報コレクション（spots）
| フィールド名 | 型        | 必須 | 説明                   | 備考例                     |
| ------------ | --------- | ---- | ---------------------- | -------------------------- |
| id           | string    | ○    | ドキュメントID         | Firestore自動生成/指定可   |
| name         | string    | ○    | 名称                   |                            |
| description  | string    |      | 説明                   |                            |
| location     | geopoint  | ○    | 位置情報（緯度・経度） | FirestoreのGeoPoint型      |
| imageUrls    | array     |      | 画像URLリスト          | 複数画像対応               |
| category     | string    |      | カテゴリ               | 例：自然、歴史、グルメ等   |
| address      | string    |      | 住所                   |                            |
| openingHours | map       |      | 営業時間               | 曜日ごとなど柔軟に拡張可能 |
| tags         | array     |      | タグ                   | 検索・分類用               |
| animeIds     | array     |      | 関連アニメIDリスト     | animeコレクションのid配列  |
| createdAt    | timestamp | ○    | 作成日時               | サーバータイムスタンプ推奨 |
| updatedAt    | timestamp |      | 更新日時               |                            |
| isPublished  | boolean   |      | 公開フラグ             |                            |

## 3. リレーション設計（spots <-> anime）
- 多対多関係を想定し、
  - 聖地（スポット）ドキュメントに `animeIds`（関連アニメIDの配列）を持たせる
  - 必要に応じてアニメ側にも `spotIds`（関連スポットIDの配列）を持たせることも可能
- Firestoreのリファレンス型やサブコレクションも選択肢だが、ID配列方式がシンプルでクエリしやすい

---

## 設計意図・補足
- **多対多リレーション**：1つの聖地が複数アニメに登場、1つのアニメが複数聖地を持つケースを想定
- **ID配列方式**：Firestoreのベストプラクティスに従い、ID配列でリレーションを管理
- **今後の拡張**：アニメ側にも `spotIds` を追加する場合は要件に応じて検討
- **柔軟性**：将来的な属性追加やリレーション拡張にも対応しやすい設計

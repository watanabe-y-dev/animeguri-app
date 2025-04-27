# タスク4メモ：Firestoreセキュリティルール・インデックス設計案

## 1. セキュリティルール設計案

### 基本方針
- スポット・アニメ情報は「閲覧は全員可」「作成・編集・削除は認証ユーザーのみ」
- 公開フラグ（isPublished）で非公開データの制御も可能

### ルール例（Firestoreルール記法）
```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // スポット情報
    match /spots/{spotId} {
      allow read: if resource.data.isPublished == true || request.auth != null;
      allow create, update, delete: if request.auth != null;
    }
    // アニメ情報
    match /animes/{animeId} {
      allow read: if true;
      allow create, update, delete: if request.auth != null;
    }
  }
}
```
- `isPublished` が true のスポットは全員閲覧可、下書きや非公開は認証ユーザーのみ閲覧可
- 編集・削除は認証ユーザーのみ

---

## 2. インデックス設計案

### 想定クエリ例
- 公開中スポット一覧取得：`spots` コレクションで `isPublished == true` で検索
- アニメIDでスポット検索：`spots` コレクションで `animeIds` 配列に特定IDが含まれるものを検索
- タグやカテゴリでの絞り込み

### インデックス例
- `isPublished` での単一フィールドインデックス（デフォルト）
- `animeIds` 配列検索用インデックス（自動）
- 複合インデックス（例：`isPublished` + `category` など）

Firestoreの管理画面でクエリ実行時に「インデックスが必要」と表示された場合、案内に従い追加

---

## 3. 設計意図・補足
- Firestoreルールは最小権限原則で設計
- 公開・非公開の制御や認証ユーザー限定編集など、運用に合わせて柔軟に調整可能
- インデックスは必要に応じて追加・調整（運用開始後も対応可）

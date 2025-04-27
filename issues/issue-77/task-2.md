# 📝 タスク2: Spotモデル・型定義作成メモ

## 概要
Firestoreのspotsコレクション設計（@task-3.md参照）に基づき、model層にSpotモデルを新規作成。

## Spotモデル定義
- ファイル: `packages/model/lib/spot.dart`
- クラス: `Spot`, `Location`
- フィールド:
  - id: String
  - name: String
  - description: String
  - location: Location（latitude: double, longitude: double）
  - imageUrls: List<String>
  - category: String
  - address: String
  - openingHours: Map<String, String>
  - tags: List<String>
  - animeIds: List<String>
  - createdAt: DateTime
  - updatedAt: DateTime
  - isPublished: bool
- fromJson/toJson 実装済み（DateTimeはISO8601文字列で変換）

## 設計意図・補足
- Firestoreのスキーマに忠実に型定義
- cloud_firestore依存なし（純粋なDartモデル）
- 今後の拡張や他層との連携を考慮し、Locationを独立クラス化
- MapやListのnull安全・型安全に配慮

## 次ステップ
- このモデルを利用してリポジトリ・ユースケース層の実装へ進む

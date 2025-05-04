# 📝 タスク3: データ取得ロジック実装メモ

## 概要
Firestoreのspotsコレクションからスポット一覧を取得するリポジトリ・ユースケースを実装。

## 実装内容
- domain層
  - SpotRepositoryインターフェース（fetchSpots）を新規作成
  - GetSpotsUseCase（リポジトリ経由でスポット一覧取得）を新規作成
- data層
  - SpotRepositoryImpl（Firestore実装）を新規作成
    - cloud_firestore: ^5.6.6 を利用
    - collection('spots').get() で全件取得し、Spot.fromJsonで変換
    - ドキュメントIDは `id` フィールドとして付与

## 設計意図・補足
- Firestore依存はdata層に閉じ、domain層は純粋なインターフェースのみ
- 取得失敗時は例外スロー（今後エラーハンドリング拡張可）
- SpotモデルはFreezedで自動生成
- 今後の拡張（ページング、フィルタ等）も考慮し、fetchSpotsはList返却

## 次ステップ
- UI層でのデータ表示・エラー/ローディング対応へ

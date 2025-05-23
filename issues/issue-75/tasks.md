<!-- このファイルはイシュー #75 用のタスク管理です -->

# 📝 Issue: 観光スポット情報をFirestoreに保存するDB定義の作成
- 🆔 Issue番号: #75
- 🔗 URL: https://github.com/watanabe-y-dev/animeguri-app/issues/75
- 📅 作成日: 2025-04-27
- 👤 作成者: watanabe-y-dev

## 📋 タスク一覧

| #   | タスク内容                                      | 説明                                                               | 状態   | 担当者 | 依存 | メモ |
| --- | ----------------------------------------------- | ------------------------------------------------------------------ | ------ | ------ | ---- | ---- |
| 1   | 🔍 既存Firestore利用状況・コレクション構成の調査 | 既存でFirestoreを使っている場合はコレクション名や構造を確認する    | ✅ 完了 |        |      |      |
| 2   | 📝 フィールド・型の洗い出し                      | 観光スポット情報に必要な属性（名称、説明、位置情報など）を整理する | ✅ 完了 |        | 1    |      |
| 3   | 🏗️ コレクション・ドキュメント設計案の作成        | Firestoreのコレクション名・ドキュメント構造・型を設計する          | ✅ 完了 |        | 2    |      |
| 4   | 🔒 セキュリティルール・インデックス設計案の作成  | Firestoreの読み書き権限や必要なインデックス設計を行う              | ✅ 完了 |        | 3    |      |
| 5   | 👀 レビュー・調整                                | 設計内容をレビューし、必要に応じて修正・調整                       | ✅ 完了 |        | 4    |      |

### 状態アイコン
- ⏳ 未着手
- 🚧 進行中
- ✅ 完了

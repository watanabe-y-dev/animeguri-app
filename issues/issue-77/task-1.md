# 📝 タスク1: Firestore連携・spotsコレクション・Spotモデルの既存実装調査メモ

## 概要
イシュー #77 のタスク1「Firestore連携の既存実装調査」に関する調査内容を記録。

## 調査対象
- data層（packages/data）
- foundation層（packages/foundation）
- domain層（packages/domain）
- model層（packages/model）

## 調査内容
### 1. data層
- Firestore連携やspotsコレクション参照の実装は見当たらず。
- `Calculator`クラスのみ存在。

### 2. foundation層
- Firestoreに関する共通処理や設定は見当たらず。
- `Calculator`クラスのみ存在。

### 3. domain層
- Firestore連携やリポジトリインターフェース、Spot関連の記述は見当たらず。
- `Calculator`クラスのみ存在。

### 4. model層
- spotsコレクションやSpotに関するモデル・型定義は見当たらず。
- `Calculator`クラスのみ存在。

## 結論
- Firestore連携やspotsコレクション参照、Spotモデルの既存実装・型定義は現状なし。
- 次タスク「Spotモデル・型定義の作成・整理」に進む前提条件を満たす。

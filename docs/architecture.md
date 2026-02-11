# アーキテクチャ

## 概要

このプロジェクトは **レイヤードアーキテクチャ** を採用しており、**3 つのレイヤー** を中心に構成されています。

```
packages/
  ├── app/             # エントリーポイント（Composition Root）
  │
  ├── ui/              # Presentation Layer
  ├── domain/          # Domain Layer
  ├── data/            # Data Layer
  │
  └── foundation/      # 共通ライブラリ
```

---

## レイヤー構成

### 1. ui (Presentation Layer)

**役割**: UI コンポーネントとページの実装

**依存**: `domain`, `foundation`

**構造**:
```
ui/lib/
  ├── page/           # 各画面のページ
  │   ├── _sample/
  │   ├── account/
  │   ├── explore/
  │   ├── map/
  │   └── ...
  ├── component/      # 再利用可能な UI コンポーネント
  ├── router/         # ルーティング (auto_route)
  ├── theme/          # テーマ設定
  └── hook/           # カスタムフック (flutter_hooks)
```

**重要なポイント**:
- **Repository を直接使用してはいけない**
- データアクセスは Notifier や UseCase を経由する
- ViewModel パターンで UI ロジックを分離

---

### 2. domain (Domain Layer)

**役割**: アプリケーションの中核となるビジネスロジックとドメインモデル

**依存**: `foundation`

**構造**:
```
domain/lib/
  ├── model/          # ドメインモデル
  │   ├── spot/       # Spot, Location など
  │   └── _sample/    # Sample モデル
  ├── repository/     # リポジトリインターフェース（抽象）
  ├── notifier/       # 状態管理 (Riverpod)
  ├── usecase/        # ユースケース
  └── exception/      # ドメイン例外
```

**重要なポイント**:
- `model/` にドメインモデルを配置
- リポジトリは **インターフェースのみ** を定義（実装は data レイヤー）
- Notifier や UseCase でビジネスロジックを実装
- 外部レイヤー（ui, data）に依存しない純粋なビジネスロジック

---

### 3. data (Data Layer)

**役割**: 外部データソース（Firestore など）との通信

**依存**: `domain`, `foundation`

**構造**:
```
data/lib/
  ├── model/                    # DTO (Data Transfer Object)
  │   └── spot/
  │       ├── spot_api_model.dart          # API 用モデル
  │       └── spot_api_model_extension.dart # ドメインモデルへの変換
  ├── repository/               # リポジトリの実装
  └── service/                  # 外部サービスとの通信
```

**重要なポイント**:
- `data/lib/model/` には API 用の DTO を配置
- `domain/lib/model/` にはドメインモデルを配置
- DTO からドメインモデルへの変換は Extension で実装
- domain のリポジトリインターフェースを実装

**DTO とドメインモデルの違い**:
```dart
// data/lib/model/spot/spot_api_model.dart (DTO)
// → Firestore のデータ構造に対応

// domain/lib/model/spot/spot.dart (ドメインモデル)
// → アプリケーションのビジネスロジックで使用

// data/lib/model/spot/spot_api_model_extension.dart
extension SpotApiModelX on SpotApiModel {
  Spot toModel() => Spot(...); // DTO → ドメインモデルへ変換
}
```

---

## エントリーポイント

### app (Composition Root)

**役割**: すべてのレイヤーを組み立ててアプリケーションを起動する

**依存**: すべてのパッケージ (`data`, `domain`, `foundation`, `ui`)

**構造**:
```
app/lib/
  ├── main.dart                        # エントリーポイント
  └── override/
      └── repository_overrides.dart    # 依存性の注入
```

**内容**:
- **Firebase の初期化**: `await Firebase.initializeApp()`
- **依存性の注入**: Repository の実装を注入
- **アプリケーションの起動**: `runApp()` でアプリを起動

**特徴**:
- ビジネスロジックを持たない
- UI を持たない
- データアクセスを持たない
- 単に「組み立て」と「起動」を行うだけの接着剤

**位置づけ**:
```
┌─────────────────────────────────┐
│   エントリーポイント (app)         │ ← すべてを組み立てる
└─────────────────────────────────┘
         ↓
    ┌────────────────┐
    │   3つのレイヤー   │
    │  ui/domain/data │
    └────────────────┘
```

---

## 共通ライブラリ

### foundation

**役割**: プロジェクト全体で使用される共通ユーティリティ

**依存**: なし（どのパッケージにも依存しない）

**内容**:
- `delay.dart`: 遅延処理のユーティリティ関数
- `result.dart`: Result 型（エラーハンドリング用の型）

**特徴**:
- ビジネスロジックを含まない純粋な技術的ユーティリティ
- すべてのレイヤーから横断的に利用される
- レイヤードアーキテクチャの「外側」に位置する

**位置づけ**:
```
┌─────────────────────────────────┐
│   共通ライブラリ (foundation)      │ ← すべてのレイヤーから利用
└─────────────────────────────────┘
         ↑    ↑    ↑
         │    │    │
        ui  domain data
```

---

## 依存関係の流れ

```
        ui (Presentation)
         ↓
      domain (Business Logic)
         ↑
        data (Data Access)
```

### データフローの例

1. **UI** → Notifier にアクション要求
2. **Notifier** → Repository 経由でデータ取得
3. **Repository (data)** → Firestore からデータ取得
4. **DTO → ドメインモデル** に変換
5. **Notifier** → State を更新
6. **UI** → 新しい State を表示

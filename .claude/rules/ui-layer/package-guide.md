---
paths: packages/ui/lib/page/**/*
---

# UI パッケージの構造

このドキュメントでは、`packages/ui` パッケージのディレクトリ構造と、ファイルの配置ルールを定義します。

## ディレクトリ構成

```
packages/ui/lib/
├── component/                    # 汎用コンポーネント
│   ├── anime_card/
│   │   ├── anime_card.dart
│   │   └── anime_card_preview.dart
│   ├── review_card/
│   ├── spot_list_item/
│   ├── ranking_list_item/
│   ├── section/
│   └── ...
├── core/
│   ├── viewmodel/               # ViewModel 基底クラス
│   └── widget/                  # 基礎的なウィジェット
│       ├── text/                # テキストコンポーネント
│       │   ├── body.dart        # TextBody
│       │   ├── label.dart       # TextLabel
│       │   ├── title.dart       # TextTitle
│       │   ├── headline.dart    # TextHeadline
│       │   └── display.dart     # TextDisplay
│       ├── async_value_builder.dart
│       ├── divided_column.dart
│       └── space.dart
├── hook/                        # カスタムフック
│   └── app_theme.dart           # useAppTheme(), useColorScheme()
├── page/                        # ページ実装
│   ├── _sample/                 # サンプルページ（テンプレート）
│   │   ├── consumer.dart
│   │   ├── page.dart
│   │   ├── viewmodel.dart
│   │   ├── viewmodel.contract.dart
│   │   └── preview.dart
│   ├── explore/                 # 発見ページ
│   │   ├── consumer.dart
│   │   ├── page.dart
│   │   ├── viewmodel.dart
│   │   ├── viewmodel.contract.dart
│   │   ├── preview.dart
│   │   └── component/           # ページ固有のコンポーネント
│   │       ├── trending_anime_section/
│   │       ├── pilgrimage_ranking_section/
│   │       └── anime_list_section/
│   ├── account/
│   ├── map/
│   └── ...
├── router/                      # ルーティング
│   └── app_router.dart
├── theme/                       # テーマ定義
│   ├── app_theme.dart
│   ├── app_theme_data.dart
│   └── color_scheme.dart
└── ui.dart                      # パッケージのエントリーポイント
```

## コンポーネントの配置ルール

### 汎用コンポーネント (`component/`)

**配置条件:**
- 複数のページで使用される、または使用される可能性があるコンポーネント
- 特定のページに依存しない独立したコンポーネント
- ビジネスロジックを持たない Pure な UI コンポーネント

**例:**
```
component/
├── anime_card/              # アニメ情報を表示するカード
├── spot_list_item/          # 聖地スポットのリストアイテム
├── ranking_list_item/       # ランキング表示のアイテム
├── section/                 # セクションヘッダー付きコンテナ
└── search_bar/              # 検索バー
```

**ファイル構成:**
```
component/
└── anime_card/
    ├── anime_card.dart          # コンポーネント本体
    └── anime_card_preview.dart  # Widget Preview
```

### ページ固有のコンポーネント (`page/{page_name}/component/`)

**配置条件:**
- 特定のページでのみ使用されるコンポーネント
- そのページの文脈に強く依存するコンポーネント
- ページ固有のレイアウトやセクション

**例:**
```
page/explore/component/
├── trending_anime_section/       # 話題の作品セクション
├── pilgrimage_ranking_section/   # 巡礼ランキングセクション
└── anime_list_section/           # 作品から探すセクション
```

**ファイル構成:**
```
page/explore/component/
└── trending_anime_section/
    └── trending_anime_section.dart  # セクション本体（プレビューは不要）
```

## 判断基準: 汎用 vs ページ固有

### 汎用コンポーネントにすべき例

✅ **AnimeCard**
- 理由: アニメ情報の表示は様々な場所で必要
- 使用例: 発見ページ、検索結果、お気に入り一覧など

✅ **SpotListItem**
- 理由: 聖地スポットのリスト表示は複数の画面で使用
- 使用例: 発見ページ、マップページ、詳細ページなど

✅ **RankingListItem**
- 理由: ランキング表示は様々な種類のランキングで使える
- 使用例: 巡礼ランキング、アニメランキング、ユーザーランキングなど

✅ **Section**
- 理由: セクション構造は汎用的なレイアウトパターン
- 使用例: すべてのページのセクション表示

### ページ固有のコンポーネントにすべき例

✅ **TrendingAnimeSection**
- 理由: 発見ページの特定のセクション
- 構成: `Section` + `AnimeCard` のリスト + ページ固有のロジック

✅ **PilgrimageRankingSection**
- 理由: 発見ページの巡礼ランキングセクション
- 構成: カスタムヘッダー + `RankingListItem` のリスト

✅ **AnimeListSection**
- 理由: 発見ページの作品から探すセクション
- 構成: 特定のレイアウトとバッジ表示

### 迷った場合の判断フロー

```
コンポーネントを作成する
    ↓
他のページでも使う予定がある？
    ↓
  YES → 汎用コンポーネント (component/)
    ↓
   NO
    ↓
将来的に他のページで使う可能性がある？
    ↓
  YES → 汎用コンポーネント (component/)
    ↓
   NO → ページ固有のコンポーネント (page/{page_name}/component/)
```

**原則:**
- 迷ったらまず **ページ固有** として作成
- 他のページで使う必要が出てきたら汎用コンポーネントに移動
- 早すぎる汎用化は避ける（YAGNI: You Aren't Gonna Need It）

## コアウィジェット (`core/widget/`)

**配置条件:**
- プロジェクト全体で使用される基礎的なウィジェット
- フレームワークレベルの抽象化
- ビジネスドメインに依存しない純粋な UI 要素

**例:**
```
core/widget/
├── text/                    # テキストコンポーネント
│   ├── body.dart            # TextBody
│   ├── label.dart           # TextLabel
│   └── title.dart           # TextTitle
├── async_value_builder.dart # 非同期状態のビルダー
├── divided_column.dart      # 区切り線付きカラム
└── space.dart               # スペーサー
```

**汎用コンポーネントとの違い:**
- **コアウィジェット**: フレームワークレベル、ドメイン非依存
  - 例: `TextBody`、`AsyncValueBuilder`
- **汎用コンポーネント**: アプリケーションレベル、ドメイン依存
  - 例: `AnimeCard`、`SpotListItem`

## ページの構成

各ページは Event-Driven State Management パターンに従います。

### 必須ファイル

```
page/{page_name}/
├── consumer.dart              # Container 層（Riverpod 接続）
├── page.dart                  # Presentation 層（Pure UI）
├── viewmodel.dart             # ViewModel 層（UI ロジック）
├── viewmodel.contract.dart    # State/Event/Effect 定義
└── preview.dart               # Widget Preview
```

### オプションファイル

```
page/{page_name}/
└── component/                 # ページ固有のコンポーネント
    ├── section_a/
    └── section_b/
```

詳細は `.claude/rules/ui-layer/coding-guide.md` を参照してください。

## まとめ

**配置の原則:**
1. ✅ **汎用性の高いもの** → `component/`
2. ✅ **ページ固有のもの** → `page/{page_name}/component/`
3. ✅ **フレームワークレベル** → `core/widget/`
4. ✅ **迷ったら** → まずページ固有、必要になったら移動

この構造に従うことで、コードの発見性と保守性が向上します。

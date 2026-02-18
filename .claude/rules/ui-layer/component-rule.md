---
paths: packages/ui/**/*
---

# UI コンポーネント開発ルール

UI 層でコンポーネントを開発する際の具体的なルールとベストプラクティスを定義します。

## 1. テーマとカラースキームの取得

| ❌ NG | ✅ OK |
|------|------|
| `Theme.of(context).colorScheme` | `useColorScheme()` |
| `Theme.of(context)` | `useAppTheme()` |

**ルール:**
- `Theme.of(context)` は使わない
- フック（`useColorScheme()`、`useAppTheme()`）を使う
- フックを使う場合は `HookWidget` を継承

## 2. テキストスタイル

| ❌ NG | ✅ OK |
|------|------|
| `Theme.of(context).textTheme.titleSmall` | `useTextTheme()` |

**ルール:**
- `Theme.of(context).textTheme` は使わない
- フック（`useTextTheme()`）を使う
- フックを使う場合は `HookWidget` を継承
- Text に適用する際は `copyWith` でカスタマイズ可能

**利用可能なスタイル:**
- `displayLarge/Medium/Small` - 大きな見出し
- `headlineLarge/Medium/Small` - 見出し
- `titleLarge/Medium/Small` - タイトル
- `bodyLarge/Medium/Small` - 本文
- `labelLarge/Medium/Small` - ラベル

## 3. カラーの使用

**基本: カラースキームから取得**
- `colorScheme.surface` - 背景色
- `colorScheme.onSurface` - テキスト色
- `colorScheme.onSurfaceVariant` - 副次的なテキスト色
- `colorScheme.primary` - プライマリカラー
- `colorScheme.outlineVariant` - ボーダー色

**例外: 特殊な色**
デザイン上の特殊な色（メダル、バッジなど）は `Color(0xFFFFD700)` のように直接指定 OK

## 4. コンポーネントの配置

詳細は `package-rule.md` を参照。

**基本ルール:**
- 汎用的 → `component/`
- ページ固有 → `page/{page_name}/component/`
- 迷ったらページ固有として作成し、必要になったら移動

## 5. コンポーネントの命名

| ❌ NG（時間的・文脈的プレフィックス） | ✅ OK（汎用的な名前） |
|----------------------------------|---------------------|
| `TrendingAnimeCard` | `AnimeCard` |
| `RecentReviewCard` | `ReviewCard` |
| `RecommendedSpotListItem` | `SpotListItem` |
| `SpotRankingListItem` | `RankingListItem` |

**ポイント:**
- コンポーネントが「何を表示するか」に焦点を当てる
- 「いつ」「どこで」使われるかは含めない
- Trending、Recent、Recommended、Popular などのプレフィックスを避ける

## 6. プロパティの汎用化

**❌ NG: 固定の文言・単位**
- `final String spotName` （「スポット」固定）
- `final int visitCount` （「訪問」固定）

**✅ OK: 汎用的なプロパティ**
- `final String title` （汎用的）
- `final String subtitle` （汎用的）
- `final int count` （汎用的）
- `final String unit` （可変の単位: '訪問', '作品', '投稿'）

**ポイント:**
- プロパティ名は役割を表す（`title`, `subtitle`, `count`）
- 単位や文言は外部から指定できるようにする
- 1 つのコンポーネントで多様なユースケースに対応

---

これらのルールに従うことで、一貫性があり、再利用可能で、保守性の高いコンポーネントを開発できます。

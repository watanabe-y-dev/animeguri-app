---
paths: packages/ui/lib/page/**/*
---

# UI コンポーネント開発ガイドライン

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

```dart
class MyWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final theme = useAppTheme();
    // ...
  }
}
```

## 2. テキストウィジェット

| ❌ NG | ✅ OK |
|------|------|
| `Text('タイトル', style: TextStyle(...))` | `TextTitle.small('タイトル')` |

**ルール:**
- 直接 `Text()` を使わない
- `packages/ui/lib/core/widget/text/` のコンポーネントを使う

**利用可能なコンポーネント:**
- `TextDisplay.large()` / `.medium()` / `.small()` - 大きな見出し
- `TextHeadline.large()` / `.medium()` / `.small()` - 見出し
- `TextTitle.large()` / `.medium()` / `.small()` - タイトル
- `TextBody.large()` / `.medium()` / `.small()` - 本文
- `TextLabel.large()` / `.medium()` / `.small()` - ラベル

**サポートされるプロパティ:**
```dart
TextTitle.small(
  'テキスト',
  color: colorScheme.primary,      // オプション
  maxLines: 2,                     // オプション
  overflow: TextOverflow.ellipsis, // オプション
  textAlign: TextAlign.center,     // オプション
)
```

## 3. カラーの使用

**基本: カラースキームから取得**
```dart
final colorScheme = useColorScheme();

color: colorScheme.surface          // 背景色
color: colorScheme.onSurface        // テキスト色
color: colorScheme.onSurfaceVariant // 副次的なテキスト色
color: colorScheme.primary          // プライマリカラー
color: colorScheme.outlineVariant   // ボーダー色
```

**例外: 特殊な色**

デザイン上の特殊な色（メダル、バッジなど）は直接指定 OK：
```dart
// メダル、バッジ、特定の意味を持つアイコンなど
1 => const Color(0xFFFFD700)  // 金メダル
```

## 4. コンポーネントの配置

詳細は `package-structure.md` を参照。

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
| `PilgrimageRankingListItem` | `RankingListItem` |

**ポイント:**
- コンポーネントが「何を表示するか」に焦点を当てる
- 「いつ」「どこで」使われるかは含めない
- Trending、Recent、Recommended、Popular などのプレフィックスを避ける

## 6. プロパティの汎用化

**❌ NG: 固定の文言・単位**
```dart
class RankingListItem extends HookWidget {
  final String spotName;    // 「スポット」固定
  final int visitCount;     // 「訪問」固定

  Widget build(BuildContext context) {
    return Text('$visitCount 訪問');  // 固定
  }
}
```

**✅ OK: 汎用的なプロパティ**
```dart
class RankingListItem extends HookWidget {
  final String title;       // 汎用的
  final String subtitle;    // 汎用的
  final int count;          // 汎用的
  final String unit;        // 可変の単位

  Widget build(BuildContext context) {
    return TextLabel.small('$count $unit');  // 可変
  }
}

// 使用例
RankingListItem(count: 28, unit: '訪問')
RankingListItem(count: 12, unit: '作品')
RankingListItem(count: 345, unit: '投稿')
```

**ポイント:**
- プロパティ名は役割を表す（`title`, `subtitle`, `count`）
- 単位や文言は外部から指定できるようにする
- 1つのコンポーネントで多様なユースケースに対応

---

これらのルールに従うことで、一貫性があり、再利用可能で、保守性の高いコンポーネントを開発できます。

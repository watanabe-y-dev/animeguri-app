---
name: page-creator
description: Event-Driven State Management パターンに従った Flutter ページを作成するスキル。適切なファイル構造（consumer, page, viewmodel, contract, preview）で新しい画面を生成します。ユーザーが新しい画面、ページ、UI コンポーネントの作成を依頼したときに使用します。テンプレートファイルとアーキテクチャガイドラインを提供し、コードベース全体で一貫した実装を実現します。
---

# Page Creator

## Overview

このスキルは、Flutter アプリで新しい画面を作成する際に、Event-Driven State Management パターンに従った適切なファイル構造とコードを生成します。

## Quick Start

新しい画面を作成する基本的な流れ：

1. `packages/ui/lib/page/{page_name}/` ディレクトリを作成
2. テンプレートファイルをコピー
3. ファイル内の `Sample` を新しいページ名に置換
4. 必要に応じて State/Event/Effect を調整
5. `packages/ui/lib/pages.dart` にエクスポートを追加
6. `packages/ui/lib/router/app_router.dart` にルートを追加
7. `melos gen` でコード生成を実行

## Step-by-Step Guide

### Step 1: ディレクトリ構造の作成

新しいページ用のディレクトリを作成します：

```bash
mkdir -p packages/ui/lib/page/{page_name}
```

### Step 2: テンプレートファイルのコピー

`packages/ui/lib/page/_sample/` から以下のファイルをコピー：

- `consumer.dart` - Riverpod と UI を接続する Container 層
- `page.dart` - 純粋な UI の Presentation 層
- `viewmodel.contract.dart` - State/Event/Effect の契約定義
- `viewmodel.dart` - UI ロジックの ViewModel 層
- `preview.dart` - Widget Preview 用のプレビュー

**注意**: `.g.dart` と `.freezed.dart` ファイルは生成されるファイルなのでコピー不要です。

### Step 3: 命名の置換

各ファイル内の以下を置換：

| Before | After | 説明 |
|--------|-------|------|
| `Sample` | `{PageName}` | クラス名（PascalCase） |
| `sample` | `{pageName}` | Provider 名（camelCase） |
| `'Sample'` | `'{Title}'` | 画面タイトル |

**置換例**：
- `SamplePage` → `UserProfilePage`
- `samplePageViewModelProvider` → `userProfilePageViewModelProvider`
- `const Text('Sample')` → `const Text('User Profile')`

### Step 4: State/Event/Effect のカスタマイズ

`viewmodel.contract.dart` で必要な定義を調整：

**State の定義例**：
```dart
@freezed
abstract class UserProfilePageState with _$UserProfilePageState {
  const factory UserProfilePageState({
    required User user,
    required bool isLoading,
  }) = _UserProfilePageState;
}
```

**Event の定義例**（過去形・受動態で命名）：
```dart
@freezed
sealed class UserProfilePageEvent with _$UserProfilePageEvent {
  const factory UserProfilePageEvent.editButtonTapped() = _EditButtonTapped;
  const factory UserProfilePageEvent.saveButtonTapped() = _SaveButtonTapped;
}
```

**Effect の定義例**（必ず `none()` を含める）：
```dart
@freezed
sealed class UserProfilePageEffect with _$UserProfilePageEffect {
  const factory UserProfilePageEffect.none() = None;
  const factory UserProfilePageEffect.showSuccessToast({
    required String message,
  }) = ShowSuccessToast;
  const factory UserProfilePageEffect.navigateToEdit() = NavigateToEdit;
}
```

### Step 5: ViewModel のロジック実装

`viewmodel.dart` で以下を実装：

1. **初期状態の構築** (`build()` メソッド)
2. **Event のハンドリング** (`onEvent()` メソッド)
3. **Effect の発火** (`effect()` メソッド)

**実装例**：
```dart
@override
Future<UserProfilePageState> build() async {
  final user = await ref.watch(userProvider.future);
  return UserProfilePageState(
    user: user,
    isLoading: false,
  );
}

@override
void onEvent(UserProfilePageEvent event) {
  event.when(
    editButtonTapped: () => effect(const UserProfilePageEffect.navigateToEdit()),
    saveButtonTapped: () => _saveProfile().ignore(),
  );
}
```

### Step 6: UI の実装

`page.dart` で UI を実装：

- `state` プロパティから状態を取得
- ユーザー操作は `onEvent()` で通知
- `useAppTheme()` でテーマにアクセス

### Step 7: Consumer の Effect ハンドリング

`consumer.dart` の `_useHandleEffect()` で Effect を処理：

```dart
void Function(UserProfilePageEffect) _useHandleEffect(WidgetRef ref) {
  final showSnackbar = useSnackbar();
  final router = useRouter();

  return useCallback(
    (effect) {
      effect.when(
        none: () => null,
        showSuccessToast: (message) =>
            showSnackbar(message, type: SnackbarType.success),
        navigateToEdit: () => router.push(const EditProfileRoute()),
      );
      ref.read(userProfilePageEffectEmitterProvider.notifier).reset();
    },
    [],
  );
}
```

### Step 8: Preview の作成

`preview.dart` でテスト用のデータを使った Preview を作成：

```dart
@Preview(name: 'User Profile Page', group: 'Page')
Widget previewUserProfilePage() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: UserProfilePage(
          state: UserProfilePageState(
            user: User(id: '1', name: 'Test User'),
            isLoading: false,
          ),
          onEvent: (event) {},
        ),
      ),
    ),
  );
}
```

### Step 9: コード生成の実行

すべてのファイルを保存したら、コード生成を実行：

```bash
melos gen
```

**注意**: `Waiting for another flutter command to release the startup lock...` というエラーが出ても無視して OK です。

### Step 10: ルーティングへの追加

新しいページをアプリから遷移できるようにするため、ルーティングに追加します。

#### 10.1 ページをエクスポート

`packages/ui/lib/pages.dart` に新しいページの consumer をエクスポート：

```dart
export 'package:ui/page/{page_name}/consumer.dart';
```

**例**：
```dart
export 'package:ui/page/user_profile/consumer.dart';
```

#### 10.2 ルーティングに追加

`packages/ui/lib/router/app_router.dart` の `routes` リストに `AutoRoute` を追加：

```dart
@AutoRouterConfig(replaceInRouteName: 'PageConsumer|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        // 既存のルート...
        AutoRoute(
          page: {PageName}Route.page,
        ),
      ];
}
```

**例**：
```dart
AutoRoute(
  page: UserProfileRoute.page,
),
```

**注意**：`{PageName}Route` の命名は自動的に生成されます（`{PageName}Consumer` → `{PageName}Route`）

#### 10.3 コード生成

ルーティングコードを生成：

```bash
melos gen
```

### Step 11: 動作確認

実装後は以下を確認：

1. `flutter analyze` で Error と Warning がないことを確認
2. Widget Preview で UI を確認
3. 実際のアプリで動作確認（ルーティング経由で画面遷移できるか）

## Naming Conventions

### ファイル名
すべて小文字で snake_case：
- `consumer.dart`
- `page.dart`
- `viewmodel.dart`
- `viewmodel.contract.dart`
- `preview.dart`

### クラス名
PascalCase で統一：
- State: `{PageName}State`
- Event: `{PageName}Event`
- Effect: `{PageName}Effect`
- ViewModel: `{PageName}ViewModel`
- Consumer: `{PageName}Consumer`
- Page: `{PageName}` (Consumer を除いた名前)

### Provider 名
camelCase で統一：
- ViewModel Provider: `{pageName}ViewModelProvider`
- Effect Provider: `{pageName}EffectEmitterProvider`

## Architecture Details

詳細なアーキテクチャパターンについては `.claude/rules/ui-layer/coding-guide.md` を参照してください：

- Event-Driven State Management の概要
- 各ファイルの役割と実装パターン
- NG パターンと OK パターン
- 重要な実装ルール
- データフローの全体像

## テンプレートファイルについて

このプロジェクトでは、`packages/ui/lib/page/_sample/` が新しいページ作成のテンプレートとして機能します。このディレクトリには、Event-Driven State Management パターンに従った標準的な実装が含まれています。

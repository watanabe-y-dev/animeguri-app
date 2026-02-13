---
paths: packages/ui/lib/page/**/*
---

# Sample Page - 実装サンプル

`packages/ui/lib/page/_sample` には、新しい画面を作成する際のベーシックな実装パターンをサンプルとして実装しています。
今後の画面開発では、この実装パターンを参考にしてください。

## アーキテクチャパターン

このサンプルは、以下のアーキテクチャパターンを採用しています：

- **Riverpod + Freezed による状態管理**
- **Event-Driven State Management（Event-State-Effect パターン）**
- **Consumer (Container) と Page (Presentation) の分離**
- **副作用 (Effect) の独立した管理**

## ファイル構成

### 1. `consumer.dart` - Consumer 層 (Container)

#### 役割

- Riverpod のプロバイダーと UI を接続する層
- 状態の監視 (`watch`) と購読 (`listen`)
- Effect の処理とハンドリング
- Scaffold や AppBar などのフレームワーク構造の定義

#### 実装ポイント

```dart
@RoutePage()
class SamplePageConsumer extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Effect ハンドラーの準備
    final handleEffect = _useHandleEffect(ref);

    // 2. 状態の監視
    final model = ref.watch(samplePageViewModelProvider);
    final notifier = ref.watch(samplePageViewModelProvider.notifier);

    // 3. Effect の購読
    ref.listen(
      samplePageEffectEmitterProvider,
      (previous, next) => handleEffect(next),
    );

    // 4. UI の構築
    return Scaffold(
      appBar: AppBar(title: const Text('Sample')),
      body: AsyncValueBuilder(
        data: model,
        builder: (data) => SamplePage(
          state: data,
          onEvent: notifier.onEvent,
        ),
      ),
    );
  }
}
```

**重要な実装パターン：**

- `ref.watch` で状態を監視し、変更があれば UI を再構築
- `ref.listen` で Effect を監視し、副作用を処理
- `AsyncValueBuilder` で非同期状態のローディング・エラーハンドリング
- Effect ハンドラーは `useCallback` で安定化

### 2. `page.dart` - Presentation 層

#### 役割

- 純粋な UI の描画に専念
- 状態とコールバックのみを受け取る
- Riverpod に依存しない、テスト可能な Widget

#### 実装ポイント

```dart
class SamplePage extends HookWidget {
  const SamplePage({
    super.key,
    required this.state,
    required this.onEvent,
  });

  final SamplePageState state;
  final void Function(SamplePageEvent) onEvent;

  @override
  Widget build(BuildContext context) {
    final theme = useAppTheme();
    // state を使って UI を構築
    // ユーザー操作は onEvent を通じて通知
  }
}
```

**重要な実装パターン：**

- 状態は `state` プロパティで受け取る
- ユーザー操作は `onEvent` コールバックで通知
- `useAppTheme()` でテーマにアクセス
- Widget は純粋関数的に実装し、副作用を持たない

### 3. `viewmodel.contract.dart` - 契約定義

#### 役割

- State, Event, Effect の定義
- Freezed による不変クラスの定義
- ViewModel と Page の間の契約を明示

#### 実装ポイント

```dart
// 状態の定義
@freezed
abstract class SamplePageState with _$SamplePageState {
  const factory SamplePageState({
    required List<Sample> samples,
  }) = _SamplePageState;
}

// イベントの定義
@freezed
sealed class SamplePageEvent with _$SamplePageEvent {
  const factory SamplePageEvent.addButtonTapped() = _SamplePageEventAddButtonTapped;
}

// エフェクトの定義
@freezed
sealed class SamplePageEffect with _$SamplePageEffect {
  const factory SamplePageEffect.none() = None;
  const factory SamplePageEffect.showSuccessToast({
    required String message,
  }) = ShowSuccessToast;
  const factory SamplePageEffect.showErrorToast({
    required String message,
  }) = ShowErrorToast;
}
```

**重要な実装パターン：**

- **State**: 画面の状態を表す不変クラス
- **Event**: ユーザーの操作（起こった事実）を表す sealed class（Union Type）
- Event の命名は過去形・受動態（`addButtonTapped`, `formSubmitted` など）
- **Effect**: 副作用（トースト表示、ダイアログ表示など）を表す sealed class
- Effect には必ず `none()` を用意し、初期状態やリセット後の状態に使用

### 4. `viewmodel.dart` - ViewModel 層

#### 役割

- UI ロジック（プレゼンテーションロジック）の実装
- 状態の管理と更新
- Event の処理
- Effect の発火
- domain レイヤーへの橋渡し

#### 実装ポイント

```dart
@riverpod
class SamplePageViewModel extends _$SamplePageViewModel
    implements ViewModelBase<SamplePageEvent, SamplePageEffect> {
  @override
  Future<SamplePageState> build() async {
    // 初期状態の構築
    final samples = await ref.watch(sampleProvider.future);
    return SamplePageState(
      samples: samples,
    );
  }

  @override
  void onEvent(SamplePageEvent event) {
    // Event のハンドリング
    event.when(
      addButtonTapped: () => _addSample().ignore(),
    );
  }

  @override
  void effect(SamplePageEffect effect) {
    // Effect の発火
    ref.read(samplePageEffectEmitterProvider.notifier).onEffect(effect);
  }

  Future<void> _addSample() async {
    try {
      await ref.read(sampleProvider.notifier).add();
      effect(const SamplePageEffect.showSuccessToast(
        message: 'Sample added successfully',
      ));
    } on Exception catch (_) {
      effect(const SamplePageEffect.showErrorToast(
        message: 'Failed to add sample',
      ));
    }
  }
}

// 汎用的な EffectEmitter を使用
final samplePageEffectEmitterProvider =
    NotifierProvider<EffectEmitter<SamplePageEffect>, SamplePageEffect>(
  () => EffectEmitter(const SamplePageEffect.none()),
);
```

**重要な実装パターン：**

- `ViewModelBase` インターフェースを実装し、`onEvent()` と `effect()` を実装
- `AsyncNotifier` を使って非同期処理に対応
- `build()` メソッドで初期状態を構築
- `onEvent()` で Event を受け取り、適切な処理を実行
- `effect()` メソッドで Effect を発火（`@protected` なので外部から呼べない）
- Effect は汎用的な `EffectEmitter` クラスと `NotifierProvider` で管理
- Effect 処理後は必ず `reset()` を呼び出す
- エラーハンドリングは try-catch で行い、適切な Effect を発火

### 5. `preview.dart` - プレビュー用コード

#### 役割

- Flutter の Widget Preview 機能でのプレビュー定義
- UI の動作確認とデザイン調整に使用

#### 実装ポイント

```dart
@Preview(name: 'Sample Page', group: 'Page')
Widget previewSamplePage() {
  final theme = AppThemeData.light();
  return MaterialApp(
    theme: theme.themeData,
    home: Scaffold(
      body: AppTheme(
        theme: theme,
        child: SamplePage(
          state: const SamplePageState(
            samples: [
              Sample(id: '1', name: 'Sample 1', description: 'Sample 1'),
              Sample(id: '2', name: 'Sample 2', description: 'Sample 2'),
            ],
          ),
          onEvent: (event) {},
        ),
      ),
    ),
  );
}
```

**重要な実装パターン：**

- `@Preview` アノテーションで Preview として登録
- テスト用の State を直接生成
- `onEvent` は空実装でも OK（動作確認が目的）
- `AppTheme` でテーマを適用

## データフローの全体像

```
User Interaction (Page)
  ↓
Event (SamplePageEvent)
  ↓
ViewModel (onEvent)
  ↓
UI ロジック
  ↓
Effect (SamplePageEffect)
  ↓
EffectEmitter (state 更新)
  ↓
Consumer (ref.listen で検知)
  ↓
Effect Handler (トースト表示など)
  ↓
EffectEmitter.reset()
```

## 新しい画面を作成する手順

1. **ディレクトリとファイルの作成**
   ```
   packages/ui/lib/page/your_page/
   ├── consumer.dart
   ├── page.dart
   ├── preview.dart
   ├── viewmodel.contract.dart
   └── viewmodel.dart
   ```

2. **`viewmodel.contract.dart` で State, Event, Effect を定義**

3. **`viewmodel.dart` で UI ロジックを実装**

4. **`page.dart` で UI を実装**

5. **`consumer.dart` で Riverpod と接続**

6. **`preview.dart` でプレビューを作成**

7. **`melos gen` でコード生成を実行**

## 実装上の注意点

### UI 層から Repository を直接使用しない

❌ **NG: ui レイヤーから直接 repository を使用**

```dart
import 'package:domain/repository/...'; // NG
```

✅ **OK: domain の Notifier 経由で使用**

```dart
import 'package:domain/notifier/...'; // OK
```

### Effect の処理後は必ず reset を呼ぶ

Effect は一度発火したら必ずリセットする必要があります。そうしないと、画面に戻ってきた際に Effect が再発火してしまいます。

```dart
ref.listen(
  samplePageEffectEmitterProvider,
  (previous, next) {
    handleEffect(next);
    ref.read(samplePageEffectEmitterProvider.notifier).reset(); // 必須
  },
);
```

### AsyncNotifier の Future は ignore する

`onEvent` メソッドは同期的に実行されるため、非同期処理の結果を待つ必要がありません。
`.ignore()` を付けて Future を無視します。

```dart
void onEvent(SamplePageEvent event) {
  event.when(
    addButtonTapped: () => _addSample().ignore(), // .ignore() を付ける
  );
}
```

### State は不変 (Immutable) に保つ

Freezed を使って State を定義しているため、State は常に不変です。
状態を更新する際は、新しい State インスタンスを作成します。

```dart
// NG: 既存の state を変更しようとする
state.value.samples.add(newSample);

// OK: 新しい state を作成
state = AsyncData(state.value.copyWith(
  samples: [...state.value.samples, newSample],
));
```

## まとめ

このサンプル実装は、以下の原則に基づいています：

1. **関心の分離**: Consumer, Page, ViewModel で責務を分離
2. **テスタビリティ**: Page は純粋な Widget として実装
3. **型安全**: Freezed による Action, Effect の Union Type
4. **副作用の管理**: Effect を独立した Provider で管理
5. **宣言的 UI**: 状態から UI を構築する React ライクなアプローチ

この実装パターンに従うことで、保守性が高く、テスト可能な画面を効率的に開発できます。

## コーディングルール

実装が完了したら `flutter analyze` を実行して Error と Warning がなくなるまで修正すること。

## アーキテクチャ

このプロジェクトはレイヤードアーキテクチャを採用しています。各レイヤーは独立したパッケージとして分離されています。

### app

アプリケーションのエントリーポイント。

### data

外部データソース（Firestore など）との通信を実装。

### domain

アプリケーションの中核となるビジネスロジックを実装。

### ui

UI や UI ロジックを実装。

- ui レイヤーから domain レイヤーに直接依存してはいけない
  - `import 'package:domain/repository/...` このようなインポートはルール違反

## Melos

- pubspec.yaml にライブラリを追加した場合は `melos get` でインストールすること
- Riverpod や Freezed のアノテーションを使用する場合は `melos gen` でコード生成すること
  - `Waiting for another flutter command to release the startup lock...` というエラーメッセージが出ても無視すること

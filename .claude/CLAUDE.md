## コーディングルール

実装が完了したら `flutter analyze` を実行して Error と Warning がなくなるまで修正すること。

## Melos

- pubspec.yaml にライブラリを追加した場合は `melos get` でインストールすること
- Riverpod や Freezed のアノテーションを使用する場合は `melos gen` でコード生成すること
  - `Waiting for another flutter command to release the startup lock...` というエラーメッセージが出ても無視すること

## コーディングルール

ソースコードに変更を加えた場合、IDE の診断情報（diagnostics）を確認すること。
Error、Warning、Info いずれかが見つかった場合はかならず修正すること。

## Melos

- pubspec.yaml にライブラリを追加した場合は `melos get` でインストールすること
- Riverpod や Freezed のアノテーションを使用する場合は `melos gen` でコード生成すること
  - `Waiting for another flutter command to release the startup lock...` というエラーメッセージが出ても無視すること

import 'package:data/repository/_sample/sample_repository.dart';
import 'package:domain/repository/_sample/sample_repository.dart';
import 'package:flutter_riverpod/misc.dart';

/// アプリケーション全体で使用する依存性のオーバーライドを定義
List<Override> getRepositoryOverrides() {
  return [
    sampleRepositoryProvider.overrideWith((ref) => SampleRepositoryImpl()),
  ];
}

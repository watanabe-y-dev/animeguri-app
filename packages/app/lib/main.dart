import 'package:app/override/repository_overrides.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ui/ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // エッジツーエッジモードを有効にして、ナビゲーションバーを透明にする
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  runApp(
    ProviderScope(
      overrides: getRepositoryOverrides(),
      child: const App(),
    ),
  );
}

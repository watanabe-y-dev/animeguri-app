import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/router.dart';
import 'package:ui/router/app_router.dart';

@RoutePage()
class AccountPage extends HookWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = useAutoRouter();

    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 64,
            ),
            const SizedBox(height: 16),
            const Text(
              'アカウント画面',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => router()?.push(const DebugHomeRoute()),
              icon: const Icon(Icons.bug_report),
              label: const Text('デバッグ画面'),
            ),
          ],
        ),
      ),
    );
  }
}

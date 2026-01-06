import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class SavedPage extends HookWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('しおり'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.bookmark,
              size: 64,
            ),
            SizedBox(height: 16),
            Text(
              'しおり画面',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 8),
            Text(
              'お気に入りの聖地を管理します',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

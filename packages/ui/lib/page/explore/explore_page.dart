import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class ExplorePage extends HookWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('発見'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.explore,
              size: 64,
            ),
            SizedBox(height: 16),
            Text(
              '発見画面',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 8),
            Text(
              '新しい聖地を探します',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

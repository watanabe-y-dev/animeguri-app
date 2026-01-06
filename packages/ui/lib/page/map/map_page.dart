import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class MapPage extends HookWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('マップ'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.map,
              size: 64,
            ),
            SizedBox(height: 16),
            Text(
              'マップ画面',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 8),
            Text(
              '地図上で聖地を確認します',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

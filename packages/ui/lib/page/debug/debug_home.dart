import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/router.dart';
import 'package:ui/router/app_router.dart';

@RoutePage()
class DebugHomePage extends HookWidget {
  const DebugHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = useAutoRouter();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('Typography Debug Page'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => router()?.push(const DebugTypographyRoute()),
            ),
            ListTile(
              title: const Text('Sample Page'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => router()?.push(const SampleRoute()),
            ),
          ],
        ),
      ),
    );
  }
}

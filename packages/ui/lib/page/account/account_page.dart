import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/app_theme.dart';
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
      body: ListView(
        children: [
          const _SectionHeader(title: 'デバッグ'),
          _MenuItem(
            icon: Icons.bug_report,
            title: 'デバッグ画面',
            onTap: () => router()?.push(const DebugHomeRoute()),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends HookWidget {
  const _SectionHeader({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();
    final textTheme = useTextTheme();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: textTheme.labelLarge?.copyWith(
          color: colorScheme.primary,
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

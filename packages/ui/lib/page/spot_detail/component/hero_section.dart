import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:ui/hook/app_theme.dart';

class HeroSection extends HookWidget {
  const HeroSection({
    super.key,
    required this.imageUrl,
    required this.onBackTap,
    required this.onShareTap,
  });

  final String imageUrl;
  final VoidCallback onBackTap;
  final VoidCallback onShareTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();

    return SizedBox(
      height: 280,
      width: double.infinity,
      child: Stack(
        children: [
          // ヒーロー画像
          Positioned.fill(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => ColoredBox(
                color: colorScheme.surfaceContainerHigh,
                child: Center(
                  child: Icon(
                    Icons.image,
                    size: 48,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ),
          // 戻るボタン
          Positioned(
            top: 8,
            left: 16,
            child: _CircleButton(
              icon: LucideIcons.chevronLeft,
              onTap: onBackTap,
            ),
          ),
          // シェアボタン
          Positioned(
            top: 8,
            right: 16,
            child: _CircleButton(
              icon: LucideIcons.share2,
              onTap: onShareTap,
            ),
          ),
          // ページインジケーター
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: EdgeInsets.only(left: index == 0 ? 0 : 6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 0
                        ? colorScheme.surfaceContainerLowest
                        : Colors.white.withValues(alpha: 0.4),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleButton extends HookWidget {
  const _CircleButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();

    return SizedBox(
      width: 40,
      height: 40,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.8),
          shape: BoxShape.circle,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onTap,
            child: Center(
              child: Icon(
                icon,
                size: 20,
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

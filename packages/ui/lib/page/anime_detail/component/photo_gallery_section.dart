import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/component/section_header/section_header.dart';
import 'package:ui/hook/app_theme.dart';

class PhotoGallerySection extends HookWidget {
  const PhotoGallerySection({
    super.key,
    required this.photoUrls,
    this.onMoreTap,
  });

  final List<String> photoUrls;
  final VoidCallback? onMoreTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = useColorScheme();

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      child: SectionHeader(
        title: 'みんなの写真',
        actionLabel: 'すべて見る',
        onActionTap: onMoreTap,
        child: SizedBox(
          height: 180,
          child: Row(
            children: [
              // 左側の大きい写真
              Expanded(
                child: _PhotoTile(
                  url: photoUrls.isNotEmpty ? photoUrls[0] : '',
                  colorScheme: colorScheme,
                ),
              ),
              const Gap(8),
              // 右側の 2 枚
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: _PhotoTile(
                        url: photoUrls.length > 1 ? photoUrls[1] : '',
                        colorScheme: colorScheme,
                      ),
                    ),
                    const Gap(8),
                    Expanded(
                      child: _PhotoTile(
                        url: photoUrls.length > 2 ? photoUrls[2] : '',
                        colorScheme: colorScheme,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhotoTile extends StatelessWidget {
  const _PhotoTile({
    required this.url,
    required this.colorScheme,
  });

  final String url;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox.expand(
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => ColoredBox(
            color: colorScheme.surfaceContainerHigh,
            child: Center(
              child: Icon(
                Icons.image,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

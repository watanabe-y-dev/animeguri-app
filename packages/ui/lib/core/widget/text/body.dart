import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/app_theme.dart';

enum _TextBodySize { large, medium, small }

class TextBody extends HookWidget {
  const TextBody.large(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextBodySize.large;

  const TextBody.medium(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextBodySize.medium;

  const TextBody.small(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextBodySize.small;

  final String data;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final _TextBodySize _size;

  @override
  Widget build(BuildContext context) {
    final theme = useAppTheme();

    final style = switch (_size) {
      _TextBodySize.large => theme.textTheme.bodyLarge,
      _TextBodySize.medium => theme.textTheme.bodyMedium,
      _TextBodySize.small => theme.textTheme.bodySmall,
    };

    return Text(
      data,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: style?.copyWith(
        color: color ?? theme.colorScheme.onSurface,
      ),
    );
  }
}

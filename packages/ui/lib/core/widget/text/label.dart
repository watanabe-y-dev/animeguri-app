import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/app_theme.dart';

enum _TextLabelSize { large, medium, small }

class TextLabel extends HookWidget {
  const TextLabel.large(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextLabelSize.large;

  const TextLabel.medium(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextLabelSize.medium;

  const TextLabel.small(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextLabelSize.small;

  final String data;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final _TextLabelSize _size;

  @override
  Widget build(BuildContext context) {
    final theme = useAppTheme();

    final style = switch (_size) {
      _TextLabelSize.large => theme.textTheme.labelLarge,
      _TextLabelSize.medium => theme.textTheme.labelMedium,
      _TextLabelSize.small => theme.textTheme.labelSmall,
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

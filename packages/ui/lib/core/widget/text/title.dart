import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/app_theme.dart';

enum _TextTitleSize { large, medium, small }

class TextTitle extends HookWidget {
  const TextTitle.large(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextTitleSize.large;

  const TextTitle.medium(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextTitleSize.medium;

  const TextTitle.small(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextTitleSize.small;

  final String data;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final _TextTitleSize _size;

  @override
  Widget build(BuildContext context) {
    final theme = useAppTheme();

    final style = switch (_size) {
      _TextTitleSize.large => theme.textTheme.titleLarge,
      _TextTitleSize.medium => theme.textTheme.titleMedium,
      _TextTitleSize.small => theme.textTheme.titleSmall,
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

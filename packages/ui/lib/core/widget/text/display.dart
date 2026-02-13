import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/app_theme.dart';

enum _TextDisplaySize { large, medium, small }

class TextDisplay extends HookWidget {
  const TextDisplay.large(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextDisplaySize.large;

  const TextDisplay.medium(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextDisplaySize.medium;

  const TextDisplay.small(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextDisplaySize.small;

  final String data;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final _TextDisplaySize _size;

  @override
  Widget build(BuildContext context) {
    final theme = useAppTheme();

    final style = switch (_size) {
      _TextDisplaySize.large => theme.textTheme.displayLarge,
      _TextDisplaySize.medium => theme.textTheme.displayMedium,
      _TextDisplaySize.small => theme.textTheme.displaySmall,
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

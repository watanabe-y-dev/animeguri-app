import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/hook/app_theme.dart';

enum _TextHeadlineSize { large, medium, small }

class TextHeadline extends HookWidget {
  const TextHeadline.large(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextHeadlineSize.large;

  const TextHeadline.medium(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextHeadlineSize.medium;

  const TextHeadline.small(
    this.data, {
    super.key,
    this.color,
    this.maxLines,
    this.overflow,
    this.textAlign,
  }) : _size = _TextHeadlineSize.small;

  final String data;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final _TextHeadlineSize _size;

  @override
  Widget build(BuildContext context) {
    final theme = useAppTheme();

    final style = switch (_size) {
      _TextHeadlineSize.large => theme.textTheme.headlineLarge,
      _TextHeadlineSize.medium => theme.textTheme.headlineMedium,
      _TextHeadlineSize.small => theme.textTheme.headlineSmall,
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

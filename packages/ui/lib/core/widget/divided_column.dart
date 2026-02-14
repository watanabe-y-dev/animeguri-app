import 'package:flutter/material.dart';

class DividedColumn extends StatelessWidget {
  const DividedColumn({
    super.key,
    required this.divider,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.tail = false,
  });

  final Widget divider;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool tail;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: children
          .expand(
            (widget) => [
              widget,
              if (children.last != widget || tail) divider,
            ],
          )
          .toList(),
    );
  }
}

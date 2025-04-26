import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Space extends StatelessWidget {
  
  const Space.xxs({super.key}) : value = 2;
  const Space.xs({super.key}) : value = 4;
  const Space.sm({super.key}) : value = 8;
  const Space.md({super.key}) : value = 16;
  const Space.lg({super.key}) : value = 24;
  const Space.xl({super.key}) : value = 32;
  const Space.xxl({super.key}) : value = 40;

  final double value;

  @override
  Widget build(BuildContext context) {
    return Gap(value);
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/component/list/divided_column.dart';
import 'package:ui/component/text/body.dart';
import 'package:ui/component/text/display.dart';
import 'package:ui/component/text/headline.dart';
import 'package:ui/component/text/label.dart';
import 'package:ui/component/text/title.dart';

@RoutePage()
class DebugTypographyPage extends HookWidget {
  const DebugTypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typography Debug Page'),
      ),
      body: const SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DividedColumn(
              divider: Gap(16),
              tail: true,
              children: [
                DisplayLarge('Display 日本語'),
                DisplayMedium('Display 日本語'),
                DisplaySmall('Display 日本語'),
                HeadlineLarge('Headline 日本語'),
                HeadlineMedium('Headline 日本語'),
                HeadlineSmall('Headline 日本語'),
                TitleLarge('Title 日本語'),
                TitleMedium('Title 日本語'),
                TitleSmall('Title 日本語'),
                BodyLarge('Body 日本語'),
                BodyMedium('Body 日本語'),
                BodySmall('Body 日本語'),
                LabelLarge('Label 日本語'),
                LabelMedium('Label 日本語'),
                LabelSmall('Label 日本語'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/core/widget/divided_column.dart';
import 'package:ui/core/widget/text/body.dart';
import 'package:ui/core/widget/text/display.dart';
import 'package:ui/core/widget/text/headline.dart';
import 'package:ui/core/widget/text/label.dart';
import 'package:ui/core/widget/text/title.dart';

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
                TextDisplay.large('Display 日本語'),
                TextDisplay.medium('Display 日本語'),
                TextDisplay.small('Display 日本語'),
                TextHeadline.large('Headline 日本語'),
                TextHeadline.medium('Headline 日本語'),
                TextHeadline.small('Headline 日本語'),
                TextTitle.large('Title 日本語'),
                TextTitle.medium('Title 日本語'),
                TextTitle.small('Title 日本語'),
                TextBody.large('Body 日本語'),
                TextBody.medium('Body 日本語'),
                TextBody.small('Body 日本語'),
                TextLabel.large('Label 日本語'),
                TextLabel.medium('Label 日本語'),
                TextLabel.small('Label 日本語'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

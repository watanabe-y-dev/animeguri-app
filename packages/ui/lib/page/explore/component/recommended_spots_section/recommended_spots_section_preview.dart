import 'package:flutter/material.dart';
import 'package:ui/page/explore/component/recommended_spots_section/recommended_spots_section.dart';

/// おすすめ聖地セクションのプレビュー
class RecommendedSpotsSectionPreview extends StatelessWidget {
  const RecommendedSpotsSectionPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: RecommendedSpotsSection(
            onSeeAllTap: () {
              debugPrint('すべてをタップ');
            },
          ),
        ),
      ),
    );
  }
}

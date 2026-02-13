import 'package:flutter/material.dart';
import 'package:ui/page/explore/component/pilgrimage_ranking_section/pilgrimage_ranking_section.dart';

class PilgrimageRankingSectionPreview extends StatelessWidget {
  const PilgrimageRankingSectionPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('PilgrimageRankingSection Preview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: PilgrimageRankingSection(
          rankings: mockRankingData,
        ),
      ),
    );
  }
}

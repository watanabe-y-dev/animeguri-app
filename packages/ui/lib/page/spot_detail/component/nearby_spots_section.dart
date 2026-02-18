import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/component.dart';

class NearbySpotData {
  const NearbySpotData({
    required this.name,
    required this.animeName,
    required this.imageUrl,
    this.badge,
  });

  final String name;
  final String animeName;
  final String imageUrl;
  final SpotBadgeType? badge;
}

class NearbySpotsSection extends HookWidget {
  const NearbySpotsSection({
    super.key,
    required this.spots,
    required this.onSpotTap,
  });

  final List<NearbySpotData> spots;
  final void Function(int index) onSpotTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
      child: SectionHeader(
        title: '近くの聖地',
        actionLabel: 'すべて見る',
        child: Column(
          children: [
            for (var i = 0; i < spots.length; i++)
              SpotListItem(
                spotName: spots[i].name,
                animeName: spots[i].animeName,
                imageUrl: spots[i].imageUrl,
                badge: spots[i].badge,
                onTap: () => onSpotTap(i),
              ),
          ],
        ),
      ),
    );
  }
}

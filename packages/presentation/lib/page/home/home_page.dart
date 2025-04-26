import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:presentation/hook/router.dart';
import 'package:presentation/page/home/sopt_list_item.dart';
import 'package:presentation/router/app_router.dart';

// 仮のデータ（実際はAPIやデータベースから取得）
final spots = [
  {
    'title': '瀧と三葉が再会した階段',
    'description':
        'この階段は「君の名は。」のポスター等のキービジュアルとして使用されている場所でもあり、映画の最後のシーンで瀧と三葉が再会した場所でもあります。',
    'images': ['https://image.lgtmoon.dev/270318'],
    'commentCount': 5,
    'visitedCount': 54,
    'bookmarkCount': 245,
  },
  {
    'title': '瀧と三葉が再会した階段',
    'description':
        'この階段は「君の名は。」のポスター等のキービジュアルとして使用されている場所でもあり、映画の最後のシーンで瀧と三葉が再会した場所でもあります。',
    'images': ['https://image.lgtmoon.dev/270318'],
    'commentCount': 5,
    'visitedCount': 54,
    'bookmarkCount': 245,
  },
  {
    'title': '瀧と三葉が再会した階段',
    'description':
        'この階段は「君の名は。」のポスター等のキービジュアルとして使用されている場所でもあり、映画の最後のシーンで瀧と三葉が再会した場所でもあります。',
    'images': ['https://image.lgtmoon.dev/270318'],
    'commentCount': 5,
    'visitedCount': 54,
    'bookmarkCount': 245,
  },
];

@RoutePage()
class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final router = useAutoRouter();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => router()?.push(const DebugHomeRoute()),
        child: const Icon(Icons.adb),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 8) +
            const EdgeInsets.symmetric(horizontal: 16),
        itemCount: spots.length,
        itemBuilder: (context, index) {
          final spot = spots[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: SpotListItem(
              title: spot['title']! as String,
              description: spot['description']! as String,
              images: spot['images']! as List<String>,
              commentCount: spot['commentCount']! as int,
              visitedCount: spot['visitedCount']! as int,
              bookmarkCount: spot['bookmarkCount']! as int,
            ),
          );
        },
      ),
    );
  }
}

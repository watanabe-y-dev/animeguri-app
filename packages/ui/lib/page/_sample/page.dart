import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:ui/hook/app_theme.dart';
import 'package:ui/page/_sample/viewmodel.dart';

class SamplePage extends HookWidget {
  const SamplePage({
    super.key,
    required this.state,
    required this.onEvent,
  });

  final SamplePageState state;
  final void Function(SamplePageEvent) onEvent;

  @override
  Widget build(BuildContext context) {
    final theme = useAppTheme();
    final color = theme.colorScheme;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: state.samples.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final sample = state.samples[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    // TODO: Add navigation or action
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: color.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.article_outlined,
                            color: color.onPrimaryContainer,
                            size: 24,
                          ),
                        ),
                        const Gap(16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                sample.name,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Gap(4),
                              Text(
                                sample.description,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: color.onSurfaceVariant,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const Gap(8),
                        Icon(
                          Icons.chevron_right,
                          color: color.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                offset: const Offset(0, -2),
                blurRadius: 4,
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () =>
                    onEvent(const SamplePageEvent.addButtonTapped()),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('追加する'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

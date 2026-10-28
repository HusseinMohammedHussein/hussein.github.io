import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../core/widgets/app_scope.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/section.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final services = AppScope.of(context).content.services;
    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= 1024 ? 4 : (width >= 700 ? 2 : 1);
    final colors = context.colors;
    final theme = Theme.of(context);

    return SiteSection(
      id: 'services',
      child: Reveal(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrow: '05 — Services',
              title: 'How I can help',
            ),
            const SizedBox(height: 32),
            LayoutBuilder(
              builder: (context, constraints) {
                final gap = AppSpacing.md;
                final cardWidth =
                    (constraints.maxWidth - gap * (columns - 1)) / columns;
                return Wrap(
                  spacing: gap,
                  runSpacing: gap,
                  children: [
                    for (var index = 0; index < services.length; index++)
                      SizedBox(
                        width: cardWidth,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: colors.surface,
                            borderRadius: BorderRadius.circular(AppRadii.lg),
                            border: Border.all(color: colors.border),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (index + 1).toString().padLeft(2, '0'),
                                  style: theme.textTheme.labelLarge?.copyWith(
                                    color: colors.accent,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  services[index].title,
                                  style: theme.textTheme.titleMedium,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  services[index].description,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

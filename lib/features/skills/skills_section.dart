import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../core/models/portfolio_models.dart';
import '../../core/widgets/app_scope.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/section.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = AppScope.of(context).content.skillGroups;
    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= 1024 ? 3 : (width >= 700 ? 2 : 1);

    return SiteSection(
      id: 'skills',
      child: Reveal(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrow: '02 — Skills',
              title: 'Tools I actually use',
              subtitle:
                  'Grouped by how they show up in shipping work — not a keyword dump.',
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
                  children: groups
                      .map(
                        (group) => SizedBox(
                          width: cardWidth,
                          child: SkillCard(group: group),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  const SkillCard({super.key, required this.group});

  final SkillGroup group;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = Theme.of(context);

    return DecoratedBox(
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
            Text(group.title, style: theme.textTheme.titleMedium),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: group.skills
                  .map(
                    (skill) => Chip(
                      visualDensity: VisualDensity.compact,
                      side: BorderSide(color: colors.border),
                      backgroundColor: colors.surfaceMuted,
                      label: Text(
                        skill,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.textPrimary,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

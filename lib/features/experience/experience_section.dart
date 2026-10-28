import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/models/portfolio_models.dart';
import '../../core/widgets/app_scope.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/section.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final items = AppScope.of(context).content.experiences;

    return SiteSection(
      id: 'experience',
      child: Reveal(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrow: '04 — Experience',
              title: 'Where I have built',
              subtitle:
                  'Roles and dates from the CV. Detailed bullets are marked until they are confirmed.',
            ),
            const SizedBox(height: 32),
            ...items.map((item) => ExperienceTile(item: item)),
          ],
        ),
      ),
    );
  }
}

class ExperienceTile extends StatelessWidget {
  const ExperienceTile({super.key, required this.item});

  final Experience item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = Theme.of(context);
    final compact = Breakpoints.isCompact(MediaQuery.sizeOf(context).width);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: colors.accent, width: 2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 0, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (compact) ...[
                Text(item.period, style: theme.textTheme.labelLarge),
                const SizedBox(height: 6),
                Text(item.role, style: theme.textTheme.titleLarge),
                Text(item.company, style: theme.textTheme.bodyLarge),
              ] else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(item.period, style: theme.textTheme.labelLarge),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.role, style: theme.textTheme.titleLarge),
                          Text(item.company, style: theme.textTheme.bodyLarge),
                        ],
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 10),
              if (item.isPlaceholderResponsibilities)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'TODO: confirm responsibilities',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colors.accent,
                    ),
                  ),
                ),
              ...item.responsibilities.map(
                (line) => Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text('–  $line', style: theme.textTheme.bodyMedium),
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: item.technologies
                    .map(
                      (tech) => Text(
                        tech,
                        style: theme.textTheme.labelSmall,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

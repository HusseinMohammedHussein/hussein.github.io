import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/widgets/app_scope.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/section.dart';

class ApproachSection extends StatelessWidget {
  const ApproachSection({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = AppScope.of(context).content.approach;
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 1024;
    final colors = context.colors;
    final theme = Theme.of(context);

    Widget stepCard(int i) {
      return DecoratedBox(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: colors.border)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                steps[i].number,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: colors.accent,
                ),
              ),
              const SizedBox(height: 12),
              Text(steps[i].title, style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(steps[i].description, style: theme.textTheme.bodyMedium),
            ],
          ),
        ),
      );
    }

    return SiteSection(
      id: 'approach',
      child: Reveal(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrow: '06 — How I Build',
              title: 'A calm path from problem to release',
            ),
            const SizedBox(height: 32),
            if (compact)
              Column(
                children: [
                  for (var i = 0; i < steps.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: stepCard(i),
                    ),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < steps.length; i++)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: i == steps.length - 1 ? 0 : 16,
                        ),
                        child: stepCard(i),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/widgets/app_scope.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final content = AppScope.of(context).content;
    final theme = Theme.of(context);

    return SiteSection(
      id: 'about',
      child: Reveal(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrow: '01 — About',
              title: 'Engineer first. Flutter specialist.',
              subtitle:
                  'Production mobile work with a bias toward architecture you can live with a year later.',
            ),
            const SizedBox(height: 32),
            ...content.aboutParagraphs.map(
              (paragraph) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(paragraph, style: theme.textTheme.bodyLarge),
              ),
            ),
            Text(
              content.profile.location,
              style: theme.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}

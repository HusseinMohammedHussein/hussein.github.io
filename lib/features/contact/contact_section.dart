import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../core/utils/launch_link.dart';
import '../../core/widgets/app_scope.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/section.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = AppScope.of(context).content.profile;
    final theme = Theme.of(context);
    final colors = context.colors;

    return SiteSection(
      id: 'contact',
      child: Reveal(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(AppRadii.lg),
            border: Border.all(color: colors.border),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionHeader(
                  eyebrow: '07 — Contact',
                  title: 'Let’s talk about the next app',
                  subtitle:
                      'Email is the fastest path. No form backend yet — mailto opens your mail client.',
                ),
                const SizedBox(height: 28),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton(
                      onPressed: () => launchLink(mailtoUrl(profile.email)),
                      child: const Text('Email me'),
                    ),
                    OutlinedButton(
                      onPressed: () => launchLink(profile.linkedinUrl),
                      child: const Text('LinkedIn'),
                    ),
                    OutlinedButton(
                      onPressed: () => launchLink(profile.githubUrl),
                      child: const Text('GitHub'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        final origin = Uri.base.origin;
                        launchLink('$origin/${profile.resumePath}');
                      },
                      child: const Text('Download CV'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SelectableText(profile.email, style: theme.textTheme.bodyLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

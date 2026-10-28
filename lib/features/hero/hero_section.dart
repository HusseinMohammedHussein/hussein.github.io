import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/constants/section_ids.dart';
import '../../core/models/portfolio_models.dart';
import '../../core/utils/launch_link.dart';
import '../../core/widgets/app_scope.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/section.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onNavigate});

  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    final profile = AppScope.of(context).content.profile;
    final socials = AppScope.of(context).content.socialLinks;
    final compact = Breakpoints.isCompact(MediaQuery.sizeOf(context).width);
    final theme = Theme.of(context);
    final colors = context.colors;

    return SiteSection(
      id: SectionIds.hero,
      padding: EdgeInsets.fromLTRB(
        compact ? AppSpacing.lg : AppSpacing.xl,
        compact ? 48 : 88,
        compact ? AppSpacing.lg : AppSpacing.xl,
        compact ? 48 : 72,
      ),
      child: Reveal(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PORTFOLIO / FLUTTER',
              style: theme.textTheme.labelLarge?.copyWith(color: colors.accent),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              profile.fullName,
              style: (compact
                      ? theme.textTheme.displaySmall
                      : theme.textTheme.displayMedium)
                  ?.copyWith(color: colors.textPrimary),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              profile.title,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: colors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Text(
                profile.tagline,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: colors.textPrimary,
                  height: 1.4,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Text(profile.summary, style: theme.textTheme.bodyLarge),
            ),
            const SizedBox(height: AppSpacing.xl),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                FilledButton(
                  onPressed: () => onNavigate(SectionIds.projects),
                  child: const Text('View Projects'),
                ),
                OutlinedButton(
                  onPressed: () => onNavigate(SectionIds.contact),
                  child: const Text('Contact Me'),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: socials
                  .map((link) => SocialButton(link: link))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.link});

  final SocialLink link;

  IconData get _icon => switch (link.icon) {
        SocialIcon.github => Icons.code,
        SocialIcon.linkedin => Icons.work_outline,
        SocialIcon.email => Icons.mail_outline,
      };

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: link.label,
      child: IconButton.outlined(
        onPressed: () => launchLink(link.url),
        icon: Icon(_icon, size: 20),
        tooltip: link.label,
      ),
    );
  }
}

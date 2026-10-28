import 'package:flutter/material.dart';

import '../../app/theme/app_spacing.dart';
import '../constants/breakpoints.dart';

class SiteSection extends StatelessWidget {
  const SiteSection({
    super.key,
    required this.id,
    required this.child,
    this.padding,
  });

  final String id;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = Breakpoints.isCompact(width);
    final vertical = compact ? AppSpacing.sectionCompact : AppSpacing.section;
    final horizontal = compact ? AppSpacing.lg : AppSpacing.xl;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppSpacing.maxContent),
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
          child: child,
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.eyebrow,
    required this.title,
    this.subtitle,
  });

  final String eyebrow;
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          eyebrow,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(title, style: theme.textTheme.displaySmall),
        if (subtitle != null) ...[
          const SizedBox(height: AppSpacing.md),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(subtitle!, style: theme.textTheme.bodyLarge),
          ),
        ],
      ],
    );
  }
}

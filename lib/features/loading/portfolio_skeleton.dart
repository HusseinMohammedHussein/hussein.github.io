import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../core/constants/breakpoints.dart';

class PortfolioSkeleton extends StatelessWidget {
  const PortfolioSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final dark = Theme.of(context).brightness == Brightness.dark;

    return Semantics(
      label: 'Loading portfolio',
      child: Skeletonizer(
        ignoreContainers: true,
        effect: ShimmerEffect(
          baseColor: colors.surfaceMuted,
          highlightColor: dark ? const Color(0xFF3A3328) : const Color(0xFFFFF8EE),
          duration: const Duration(milliseconds: 1400),
        ),
        child: const _SkeletonLayout(),
      ),
    );
  }
}

class _SkeletonLayout extends StatelessWidget {
  const _SkeletonLayout();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final width = MediaQuery.sizeOf(context).width;
    final compact = Breakpoints.isCompact(width);

    return Scaffold(
      backgroundColor: colors.canvas,
      body: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: colors.border)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                children: [
                  Bone.text(width: 36, fontSize: 16),
                  const Spacer(),
                  if (!compact) ...[
                    Bone.text(width: 52, fontSize: 14),
                    const SizedBox(width: 20),
                    Bone.text(width: 48, fontSize: 14),
                    const SizedBox(width: 20),
                    Bone.text(width: 64, fontSize: 14),
                    const SizedBox(width: 20),
                    Bone.text(width: 78, fontSize: 14),
                    const SizedBox(width: 12),
                  ],
                  const Bone.icon(size: 22),
                  if (compact) ...[
                    const SizedBox(width: 8),
                    const Bone.icon(size: 22),
                  ],
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: AppSpacing.maxContent),
                child: ListView(
                  padding: EdgeInsets.fromLTRB(
                    compact ? AppSpacing.lg : AppSpacing.xl,
                    compact ? 48 : 88,
                    compact ? AppSpacing.lg : AppSpacing.xl,
                    48,
                  ),
                  children: [
                    Bone.text(width: 160, fontSize: 12),
                    const SizedBox(height: AppSpacing.lg),
                    Bone.text(
                      width: compact ? 280 : 460,
                      fontSize: compact ? 36 : 48,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Bone.text(width: compact ? 220 : 280, fontSize: 22),
                    const SizedBox(height: AppSpacing.lg),
                    const Bone.multiText(lines: 2, fontSize: 20),
                    const SizedBox(height: AppSpacing.md),
                    const Bone.multiText(lines: 3, fontSize: 17),
                    const SizedBox(height: AppSpacing.xl),
                    const Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        Bone.button(width: 148, height: 48),
                        Bone.button(width: 132, height: 48),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    const Row(
                      children: [
                        Bone.circle(size: 40),
                        SizedBox(width: 8),
                        Bone.circle(size: 40),
                        SizedBox(width: 8),
                        Bone.circle(size: 40),
                      ],
                    ),
                    SizedBox(height: compact ? 64 : 96),
                    Bone.text(width: 110, fontSize: 12),
                    const SizedBox(height: AppSpacing.sm),
                    Bone.text(width: compact ? 260 : 420, fontSize: 36),
                    const SizedBox(height: AppSpacing.md),
                    const Bone.multiText(lines: 2, fontSize: 17),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PortfolioLoadError extends StatelessWidget {
  const PortfolioLoadError({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'The portfolio could not be loaded.',
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              FilledButton(
                onPressed: onRetry,
                child: const Text('Try again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

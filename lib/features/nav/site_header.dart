import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_colors.dart';
import '../../core/constants/breakpoints.dart';
import '../../core/constants/section_ids.dart';
import '../../core/widgets/app_scope.dart';

class SiteHeader extends StatelessWidget {
  const SiteHeader({
    super.key,
    required this.onNavigate,
    required this.onOpenMenu,
  });

  final ValueChanged<String> onNavigate;
  final VoidCallback onOpenMenu;

  @override
  Widget build(BuildContext context) {
    final content = AppScope.of(context).content;
    final theme = Theme.of(context);
    final colors = context.colors;
    final compact = Breakpoints.isCompact(MediaQuery.sizeOf(context).width);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: colors.canvas.withValues(alpha: 0.92),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: colors.border)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  if (GoRouterState.of(context).uri.path != '/') {
                    context.go('/');
                  } else {
                    onNavigate(SectionIds.hero);
                  }
                },
                child: Text(
                  content.profile.shortName,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              const Spacer(),
              if (!compact)
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final item in content.navItems)
                          TextButton(
                            onPressed: () => onNavigate(item.sectionId),
                            child: Text(item.label),
                          ),
                      ],
                    ),
                  ),
                ),
              IconButton(
                tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
                onPressed: () => AppScope.of(context).themeController.toggle(),
                icon: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
              ),
              if (compact)
                IconButton(
                  tooltip: 'Open menu',
                  onPressed: onOpenMenu,
                  icon: const Icon(Icons.menu),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class MobileMenu extends StatelessWidget {
  const MobileMenu({super.key, required this.onNavigate});

  final ValueChanged<String> onNavigate;

  @override
  Widget build(BuildContext context) {
    final items = AppScope.of(context).content.navItems;
    final colors = context.colors;

    return Drawer(
      backgroundColor: colors.surface,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
          children: [
            for (final item in items)
              ListTile(
                title: Text(item.label),
                onTap: () {
                  Navigator.of(context).pop();
                  onNavigate(item.sectionId);
                },
              ),
          ],
        ),
      ),
    );
  }
}

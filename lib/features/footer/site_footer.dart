import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../core/widgets/app_scope.dart';
import '../../core/widgets/section.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = AppScope.of(context).content.profile;
    final theme = Theme.of(context);
    final colors = context.colors;
    final year = DateTime.now().year;

    return SiteSection(
      id: 'footer',
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
      child: Column(
        children: [
          Divider(color: colors.border),
          const SizedBox(height: 20),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 8,
            spacing: 16,
            children: [
              Text(
                '© $year ${profile.fullName}',
                style: theme.textTheme.bodySmall,
              ),
              Text(
                'Built with Flutter Web',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

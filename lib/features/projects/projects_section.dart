import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_spacing.dart';
import '../../core/models/portfolio_models.dart';
import '../../core/utils/launch_link.dart';
import '../../core/widgets/app_scope.dart';
import '../../core/widgets/reveal.dart';
import '../../core/widgets/section.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = AppScope.of(context).content.projects;
    final width = MediaQuery.sizeOf(context).width;
    final columns = width >= 1100 ? 3 : (width >= 720 ? 2 : 1);

    return SiteSection(
      id: 'projects',
      child: Reveal(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(
              eyebrow: '03 — Work',
              title: 'Selected projects',
              subtitle:
                  'Engineering-focused case notes. Store and GitHub links are real; screenshots can be added later.',
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
                  children: [
                    for (var i = 0; i < projects.length; i++)
                      SizedBox(
                        width: cardWidth,
                        child: ProjectCard(project: projects[i], index: i),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
    required this.index,
  });

  final Project project;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = Theme.of(context);
    final number = (index + 1).toString().padLeft(2, '0');

    return HoverLift(
      child: Material(
        color: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.lg),
          side: BorderSide(color: colors.border),
        ),
        child: InkWell(
          onTap: () => context.go('/projects/${project.slug}'),
          borderRadius: BorderRadius.circular(AppRadii.lg),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProjectPlaceholder(label: project.name, number: number),
                const SizedBox(height: AppSpacing.md),
                Text(
                  number,
                  style: theme.textTheme.labelSmall,
                ),
                const SizedBox(height: 6),
                Text(project.name, style: theme.textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  project.shortDescription,
                  style: theme.textTheme.bodyMedium,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: project.technologies
                      .take(4)
                      .map(
                        (tech) => Text(
                          tech,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: colors.accent,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 12),
                Text(
                  'View details →',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectPlaceholder extends StatelessWidget {
  const ProjectPlaceholder({
    super.key,
    required this.label,
    required this.number,
  });

  final String label;
  final String number;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final theme = Theme.of(context);

    return Semantics(
      label: 'Placeholder visual for $label. Screenshot not added yet.',
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colors.surfaceMuted,
          borderRadius: BorderRadius.circular(AppRadii.md),
          border: Border.all(color: colors.border),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'TODO screenshot · $number',
              style: theme.textTheme.labelSmall,
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    final project = AppScope.of(context).content.projectBySlug(slug);
    final colors = context.colors;
    final theme = Theme.of(context);

    if (project == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Project not found'),
              TextButton(
                onPressed: () => context.go('/'),
                child: const Text('Back home'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: colors.canvas,
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Back to projects',
          onPressed: () => context.go('/?section=projects'),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(project.name, style: theme.textTheme.titleMedium),
      ),
      body: ColoredBox(
        color: colors.canvas,
        child: SelectionArea(
          child: SingleChildScrollView(
            child: CenteredBody(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProjectPlaceholder(label: project.name, number: ''),
                    const SizedBox(height: 28),
                    Text(project.name, style: theme.textTheme.displaySmall),
                    const SizedBox(height: 16),
                    Text(project.description, style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 28),
                    Text('Technical highlights', style: theme.textTheme.titleLarge),
                    const SizedBox(height: 12),
                    ...project.technicalHighlights.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('–  ', style: theme.textTheme.bodyMedium),
                            Expanded(
                              child: Text(item, style: theme.textTheme.bodyMedium),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text('Contribution', style: theme.textTheme.titleLarge),
                    const SizedBox(height: 12),
                    Text(project.contribution, style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: project.technologies
                          .map(
                            (tech) => Chip(
                              side: BorderSide(color: colors.border),
                              backgroundColor: colors.surfaceMuted,
                              label: Text(tech),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 28),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: project.links
                          .map(
                            (link) => OutlinedButton(
                              onPressed: () => launchLink(link.url),
                              child: Text(link.label),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

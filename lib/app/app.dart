import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/models/portfolio_models.dart';
import '../core/widgets/app_scope.dart';
import '../features/home/home_page.dart';
import '../features/projects/projects_section.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';

GoRouter createRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: HomePage(
              initialSection: state.uri.queryParameters['section'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/projects/:slug',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: ProjectDetailPage(slug: state.pathParameters['slug']!),
          );
        },
      ),
    ],
  );
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({
    super.key,
    required this.content,
    required this.themeController,
    required this.router,
  });

  final PortfolioContent content;
  final ThemeController themeController;
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return AppScope(
      content: content,
      themeController: themeController,
      child: ListenableBuilder(
        listenable: themeController,
        builder: (context, _) {
          return MaterialApp.router(
            title: 'Hussein Mohammed — Senior Flutter Developer',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: themeController.mode,
            routerConfig: router,
            builder: (context, child) {
              return ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: child ?? const SizedBox.shrink(),
              );
            },
          );
        },
      ),
    );
  }
}

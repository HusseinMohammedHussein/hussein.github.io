import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/data/local_portfolio_repository.dart';
import '../core/data/portfolio_repository.dart';
import '../core/models/portfolio_models.dart';
import '../features/loading/portfolio_skeleton.dart';
import 'app.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';

class PortfolioBootstrap extends StatefulWidget {
  const PortfolioBootstrap({
    super.key,
    this.repository = const LocalPortfolioRepository(),
    this.minimumSkeleton = const Duration(milliseconds: 900),
  });

  final PortfolioRepository repository;

  /// Keeps the skeleton on screen long enough to paint. Local data resolves
  /// in a microtask, before Flutter draws the first frame, so without this
  /// the placeholder never appears.
  final Duration minimumSkeleton;

  @override
  State<PortfolioBootstrap> createState() => _PortfolioBootstrapState();
}

class _PortfolioBootstrapState extends State<PortfolioBootstrap> {
  final _themeController = ThemeController();
  late final GoRouter _router = createRouter();

  PortfolioContent? _content;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final started = DateTime.now();
    if (_failed || _content != null) {
      setState(() {
        _failed = false;
        _content = null;
      });
    }

    try {
      final themeReady = _themeController.load();
      final contentFuture = widget.repository.load();
      await WidgetsBinding.instance.endOfFrame;
      final content = await contentFuture;
      await themeReady;
      final elapsed = DateTime.now().difference(started);
      final remaining = widget.minimumSkeleton - elapsed;
      if (remaining > Duration.zero) {
        await Future<void>.delayed(remaining);
      }
      if (!mounted) return;
      setState(() => _content = content);
    } catch (_) {
      if (!mounted) return;
      setState(() => _failed = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final content = _content;
    if (content != null) {
      return PortfolioApp(
        content: content,
        themeController: _themeController,
        router: _router,
      );
    }

    return ListenableBuilder(
      listenable: _themeController,
      builder: (context, _) {
        return MaterialApp(
          title: 'Hussein Mohammed — Senior Flutter Developer',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: _themeController.mode,
          home: _failed
              ? PortfolioLoadError(onRetry: _load)
              : const PortfolioSkeleton(),
        );
      },
    );
  }
}

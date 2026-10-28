import 'package:flutter/material.dart';

import '../constants/breakpoints.dart';
import '../models/portfolio_models.dart';
import '../../app/theme/theme_controller.dart';

class AppScope extends InheritedWidget {
  const AppScope({
    super.key,
    required this.content,
    required this.themeController,
    required super.child,
  });

  final PortfolioContent content;
  final ThemeController themeController;

  static AppScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppScope>();
    assert(scope != null, 'AppScope not found');
    return scope!;
  }

  @override
  bool updateShouldNotify(AppScope oldWidget) {
    return content != oldWidget.content ||
        themeController != oldWidget.themeController;
  }
}

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, AppBreakpoint breakpoint, double width)
      builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = MediaQuery.sizeOf(context).width;
        return builder(context, Breakpoints.ofWidth(width), width);
      },
    );
  }
}

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:portfolio_site/app/app.dart';
import 'package:portfolio_site/app/bootstrap.dart';
import 'package:portfolio_site/app/theme/theme_controller.dart';
import 'package:portfolio_site/core/data/local_portfolio_repository.dart';
import 'package:portfolio_site/core/data/portfolio_repository.dart';
import 'package:portfolio_site/core/models/portfolio_models.dart';
import 'package:portfolio_site/features/loading/portfolio_skeleton.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    GoogleFonts.config.allowRuntimeFetching = false;
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('renders hero identity', (tester) async {
    final themeController = ThemeController();
    await themeController.load();

    await tester.pumpWidget(
      PortfolioApp(
        content: localPortfolioContent,
        themeController: themeController,
        router: createRouter(),
      ),
    );
    await tester.pump();

    expect(find.text('Hussein Mohammed'), findsWidgets);
    expect(find.text('View Projects'), findsOneWidget);
  });

  testWidgets('shows a skeleton until portfolio data loads', (tester) async {
    final repository = _PendingRepository();
    const minimumSkeleton = Duration(milliseconds: 400);

    await tester.pumpWidget(
      PortfolioBootstrap(
        repository: repository,
        minimumSkeleton: minimumSkeleton,
      ),
    );

    expect(find.byType(PortfolioSkeleton), findsOneWidget);
    expect(find.text('View Projects'), findsNothing);

    repository.complete(localPortfolioContent);
    await tester.pump();

    expect(find.byType(PortfolioSkeleton), findsOneWidget);

    await tester.pump(minimumSkeleton);
    await tester.pump();

    expect(find.byType(PortfolioSkeleton), findsNothing);
    expect(find.text('View Projects'), findsOneWidget);
  });
}

class _PendingRepository implements PortfolioRepository {
  final _completer = Completer<PortfolioContent>();

  void complete(PortfolioContent content) {
    if (!_completer.isCompleted) _completer.complete(content);
  }

  @override
  Future<PortfolioContent> load() => _completer.future;
}

import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:portfolio_site/app/app.dart';
import 'package:portfolio_site/app/theme/theme_controller.dart';
import 'package:portfolio_site/core/data/local_portfolio_repository.dart';

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
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/app.dart';
import 'app/theme/theme_controller.dart';
import 'core/data/local_portfolio_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = true;

  final themeController = ThemeController();
  await themeController.load();

  final content = await const LocalPortfolioRepository().load();

  runApp(
    PortfolioApp(
      content: content,
      themeController: themeController,
      router: createRouter(),
    ),
  );
}

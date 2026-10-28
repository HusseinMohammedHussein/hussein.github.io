import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_spacing.dart';

abstract final class AppTheme {
  static ThemeData dark() => _build(Brightness.dark, AppColors.dark);

  static ThemeData light() => _build(Brightness.light, AppColors.light);

  static ThemeData _build(Brightness brightness, AppColors colors) {
    final display = GoogleFonts.fraunces(
      color: colors.textPrimary,
      fontWeight: FontWeight.w500,
      height: 1.15,
      letterSpacing: -0.6,
    );
    final body = GoogleFonts.manrope(
      color: colors.textPrimary,
      height: 1.55,
    );
    final mono = GoogleFonts.ibmPlexMono(
      color: colors.textSecondary,
      letterSpacing: 0.4,
    );

    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: colors.accent,
        onPrimary: colors.inverse,
        secondary: colors.surfaceMuted,
        onSecondary: colors.textPrimary,
        error: const Color(0xFFCF6679),
        onError: colors.textPrimary,
        surface: colors.surface,
        onSurface: colors.textPrimary,
      ),
      scaffoldBackgroundColor: colors.canvas,
      extensions: [colors],
    );

    return base.copyWith(
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          for (final platform in TargetPlatform.values)
            platform: const InstantPageTransitionsBuilder(),
        },
      ),
      textTheme: TextTheme(
        displayLarge: display.copyWith(fontSize: 64),
        displayMedium: display.copyWith(fontSize: 48),
        displaySmall: display.copyWith(fontSize: 36),
        headlineMedium: display.copyWith(fontSize: 28),
        headlineSmall: display.copyWith(fontSize: 22),
        titleLarge: body.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
        titleMedium: body.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        bodyLarge: body.copyWith(fontSize: 17, color: colors.textSecondary),
        bodyMedium: body.copyWith(fontSize: 15, color: colors.textSecondary),
        bodySmall: body.copyWith(fontSize: 13, color: colors.textTertiary),
        labelLarge: mono.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
        labelSmall: mono.copyWith(fontSize: 11, color: colors.textTertiary),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colors.canvas,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      dividerColor: colors.border,
      cardTheme: CardThemeData(
        color: colors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.lg),
          side: BorderSide(color: colors.border),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colors.accent,
          foregroundColor: colors.inverse,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.sm),
          ),
          textStyle: body.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.textPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          side: BorderSide(color: colors.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadii.sm),
          ),
          textStyle: body.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colors.textPrimary,
          borderRadius: BorderRadius.circular(AppRadii.sm),
        ),
        textStyle: body.copyWith(color: colors.inverse, fontSize: 12),
      ),
    );
  }
}

class InstantPageTransitionsBuilder extends PageTransitionsBuilder {
  const InstantPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}

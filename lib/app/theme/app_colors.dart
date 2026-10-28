import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.canvas,
    required this.surface,
    required this.surfaceMuted,
    required this.border,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.accent,
    required this.accentMuted,
    required this.inverse,
  });

  final Color canvas;
  final Color surface;
  final Color surfaceMuted;
  final Color border;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color accent;
  final Color accentMuted;
  final Color inverse;

  static const dark = AppColors(
    canvas: Color(0xFF0B0C0F),
    surface: Color(0xFF14161C),
    surfaceMuted: Color(0xFF1B1E26),
    border: Color(0xFF2A2E38),
    textPrimary: Color(0xFFF2F0EA),
    textSecondary: Color(0xFFB7B4AB),
    textTertiary: Color(0xFF7D7A72),
    accent: Color(0xFFD7B07A),
    accentMuted: Color(0x33D7B07A),
    inverse: Color(0xFF0B0C0F),
  );

  static const light = AppColors(
    canvas: Color(0xFFF6F4EF),
    surface: Color(0xFFFFFFFF),
    surfaceMuted: Color(0xFFEEEBE3),
    border: Color(0xFFDDD8CE),
    textPrimary: Color(0xFF16171C),
    textSecondary: Color(0xFF5C5A54),
    textTertiary: Color(0xFF8A877E),
    accent: Color(0xFF8A5A22),
    accentMuted: Color(0x228A5A22),
    inverse: Color(0xFFF6F4EF),
  );

  @override
  AppColors copyWith({
    Color? canvas,
    Color? surface,
    Color? surfaceMuted,
    Color? border,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? accent,
    Color? accentMuted,
    Color? inverse,
  }) {
    return AppColors(
      canvas: canvas ?? this.canvas,
      surface: surface ?? this.surface,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      border: border ?? this.border,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      accent: accent ?? this.accent,
      accentMuted: accentMuted ?? this.accentMuted,
      inverse: inverse ?? this.inverse,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      canvas: Color.lerp(canvas, other.canvas, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceMuted: Color.lerp(surfaceMuted, other.surfaceMuted, t)!,
      border: Color.lerp(border, other.border, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentMuted: Color.lerp(accentMuted, other.accentMuted, t)!,
      inverse: Color.lerp(inverse, other.inverse, t)!,
    );
  }
}

extension AppColorsX on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
}

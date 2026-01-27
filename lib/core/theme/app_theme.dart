import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary - Cyber orange/amber from Arc Raiders branding
  static const primary = Color(0xFFFF6B00);
  static const primaryLight = Color(0xFFFF8C3A);
  static const primaryDark = Color(0xFFCC5500);

  // Background - Dark sci-fi theme
  static const background = Color(0xFF0D1117);
  static const surface = Color(0xFF161B22);
  static const surfaceLight = Color(0xFF21262D);
  static const surfaceHighlight = Color(0xFF30363D);

  // Text
  static const textPrimary = Color(0xFFE6EDF3);
  static const textSecondary = Color(0xFF8B949E);
  static const textTertiary = Color(0xFF6E7681);

  // Status
  static const online = Color(0xFF3FB950);
  static const warning = Color(0xFFD29922);
  static const error = Color(0xFFF85149);

  // Regions
  static const europe = Color(0xFF58A6FF);
  static const northAmerica = Color(0xFFF778BA);
  static const asia = Color(0xFFA371F7);
  static const southAmerica = Color(0xFF3FB950);
  static const oceania = Color(0xFFD29922);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.primaryLight,
        surface: AppColors.surface,
        error: AppColors.error,
        background: AppColors.background,
      ),
      textTheme: GoogleFonts.rajdhaniTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: GoogleFonts.rajdhani(
          color: AppColors.textPrimary,
          fontSize: 72,
          fontWeight: FontWeight.bold,
          height: 0.9,
        ),
        displayMedium: GoogleFonts.rajdhani(
          color: AppColors.textPrimary,
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.rajdhani(
          color: AppColors.textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: GoogleFonts.rajdhani(
          color: AppColors.textSecondary,
          fontSize: 18,
        ),
        bodyMedium: GoogleFonts.rajdhani(
          color: AppColors.textSecondary,
          fontSize: 16,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardTheme(
        color: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.surfaceHighlight),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(8),
      ),
      iconTheme: const IconThemeData(color: AppColors.textSecondary),
    );
  }
}

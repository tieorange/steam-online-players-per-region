import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Arc Raiders Color Palette - Cassette Futurism Aesthetic
/// Inspired by 70s/80s sci-fi, VHS-era visuals, Cold War utilitarian design
class AppColors {
  // Brand Primary - Official "Guardsman Red"
  static const primary = Color(0xFFD00000);
  static const primaryLight = Color(0xFFE53935);
  static const primaryDark = Color(0xFF9A0000);

  // Synthwave Rainbow Accents (Logo diagonal stripes)
  static const accentCyan = Color(0xFF00D9FF);
  static const accentYellow = Color(0xFFFFE100);
  static const accentOrange = Color(0xFFFF8C00);
  static const accentMagenta = Color(0xFFFF00FF);

  // VHS-Era Muted Backgrounds (Cassette Futurism)
  static const background = Color(0xFF0F0D0B); // Near-black with warm tint
  static const surface = Color(0xFF1A1714); // Dark sepia
  static const surfaceLight = Color(0xFF252019); // Worn metal feel
  static const surfaceHighlight = Color(0xFF3D342B); // Aged paper tint

  // Cold War Utilitarian Text (brighter for readability)
  static const textPrimary = Color(0xFFF5EDE3); // Warm white (brighter)
  static const textSecondary = Color(0xFFCDBFAD); // Muted tan (brighter)
  static const textTertiary = Color(0xFF9A8B7A); // Dusty brown (brighter)

  // CRT Monitor Glow Accents
  static const glowCyan = Color(0x6600D9FF);
  static const glowRed = Color(0x66D00000);

  // Status colors (Arc Raiders style)
  static const online = Color(0xFF00D9FF); // Cyan glow for online
  static const warning = Color(0xFFFFE100); // Yellow
  static const error = Color(0xFFD00000); // Guardsman Red

  // Region colors (synthwave palette)
  static const europe = Color(0xFF00D9FF); // Cyan
  static const northAmerica = Color(0xFFD00000); // Red
  static const asia = Color(0xFFFF00FF); // Magenta
  static const southAmerica = Color(0xFFFFE100); // Yellow
  static const oceania = Color(0xFFFF8C00); // Orange

  // FX
  static const surfaceGlass = Color(0x15F5EDE3);
  static const borderGlow = Color(0x33D00000);
  static const overlay = Color(0xDD0F0D0B);

  // Arc Raiders specific gradients
  static const synthwaveGradient = LinearGradient(
    colors: [accentCyan, accentYellow, accentOrange, primary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const glassGradient = LinearGradient(
    colors: [Color(0x20F5EDE3), Color(0x08F5EDE3)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const primaryGradient = LinearGradient(
    colors: [accentCyan, accentYellow, accentOrange, primary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

class AppAnimations {
  static const fast = Duration(milliseconds: 150);
  static const medium = Duration(milliseconds: 300);
  static const slow = Duration(milliseconds: 500);
  static const verySlow = Duration(milliseconds: 1000);

  static const curve = Curves.easeOutCubic;
  static const bounce = Curves.easeOutBack;
}

/// Helper class to get theme colors throughout the app
/// Usage: final colors = ThemeColors.of(context);
class ThemeColors {
  ThemeColors._(this._context);

  final BuildContext _context;

  static ThemeColors of(BuildContext context) => ThemeColors._(context);

  // All colors now directly use AppColors (Arc Raiders palette)
  bool get isDark => true; // Always dark theme
  bool get isArcRaiders => true;

  // Background colors
  Color get background => AppColors.background;
  Color get surface => AppColors.surface;
  Color get surfaceLight => AppColors.surfaceLight;
  Color get surfaceHighlight => AppColors.surfaceHighlight;

  // Text colors
  Color get textPrimary => AppColors.textPrimary;
  Color get textSecondary => AppColors.textSecondary;
  Color get textTertiary => AppColors.textTertiary;

  // Primary/accent colors
  Color get primary => AppColors.primary;
  Color get primaryLight => AppColors.primaryLight;

  // Status colors
  Color get online => AppColors.online;
  Color get warning => AppColors.warning;
  Color get error => AppColors.error;

  // Gradients
  LinearGradient get glassGradient => AppColors.glassGradient;
  LinearGradient get primaryGradient => AppColors.primaryGradient;
}

class AppTheme {
  /// Arc Raiders theme - Cassette Futurism aesthetic
  /// Single theme inspired by 70s/80s sci-fi, VHS-era visuals
  static ThemeData get theme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.accentCyan,
        surface: AppColors.surface,
        error: AppColors.error,
      ),
      // Typography: Orbitron for headings, Barlow for body, JetBrains Mono for HUD
      textTheme: _buildTextTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Geometric, angular
          side: const BorderSide(color: AppColors.surfaceHighlight),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(8),
      ),
      iconTheme: const IconThemeData(color: AppColors.textSecondary),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textPrimary,
          textStyle: GoogleFonts.barlow(
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  static TextTheme _buildTextTheme() {
    return GoogleFonts.barlowTextTheme(ThemeData.dark().textTheme).copyWith(
      // Display - Large headers (Orbitron for sci-fi feel)
      displayLarge: GoogleFonts.orbitron(
        color: AppColors.textPrimary,
        fontSize: 72,
        fontWeight: FontWeight.bold,
        height: 0.9,
        letterSpacing: 2,
      ),
      displayMedium: GoogleFonts.orbitron(
        color: AppColors.textPrimary,
        fontSize: 48,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
      displaySmall: GoogleFonts.orbitron(
        color: AppColors.textPrimary,
        fontSize: 36,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
      // Headlines (Orbitron)
      headlineLarge: GoogleFonts.orbitron(
        color: AppColors.textPrimary,
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
      headlineMedium: GoogleFonts.orbitron(
        color: AppColors.textPrimary,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
      headlineSmall: GoogleFonts.orbitron(
        color: AppColors.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
      // Titles (Barlow Semi-Bold)
      titleLarge: GoogleFonts.barlow(
        color: AppColors.textPrimary,
        fontSize: 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
      ),
      titleMedium: GoogleFonts.barlow(
        color: AppColors.textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
      titleSmall: GoogleFonts.barlow(
        color: AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
      // Body (Barlow Regular)
      bodyLarge: GoogleFonts.barlow(
        color: AppColors.textSecondary,
        fontSize: 18,
      ),
      bodyMedium: GoogleFonts.barlow(
        color: AppColors.textSecondary,
        fontSize: 16,
      ),
      bodySmall: GoogleFonts.barlow(
        color: AppColors.textTertiary,
        fontSize: 14,
      ),
      // Labels (JetBrains Mono for HUD/numbers)
      labelLarge: GoogleFonts.jetBrainsMono(
        color: AppColors.textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
      ),
      labelMedium: GoogleFonts.jetBrainsMono(
        color: AppColors.textSecondary,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
      ),
      labelSmall: GoogleFonts.jetBrainsMono(
        color: AppColors.textTertiary,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
      ),
    );
  }

  // Legacy getter for backwards compatibility
  static ThemeData get arcRaidersTheme => theme;
}

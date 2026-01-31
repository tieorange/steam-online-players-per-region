import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:flutter/material.dart';

/// Extension on [Region] to provide display properties and utilities.
///
/// Consolidates logic previously duplicated across:
/// - BestServerCard
/// - PingEstimatorCard
/// - RegionDistributionChart
extension RegionX on Region {
  /// Returns a user-friendly display name for the region.
  String get displayName => switch (this) {
        Region.northAmerica => 'North America',
        Region.southAmerica => 'South America',
        Region.europe => 'Europe',
        Region.asia => 'Asia',
        Region.oceania => 'Oceania',
      };

  /// Returns a short abbreviation for the region.
  String get abbreviation => switch (this) {
        Region.northAmerica => 'NA',
        Region.southAmerica => 'SA',
        Region.europe => 'EU',
        Region.asia => 'AS',
        Region.oceania => 'OC',
      };

  /// Returns the emoji flag representing the region.
  String get flag => switch (this) {
        Region.northAmerica => '🇺🇸', // US flag for NA
        Region.southAmerica => '🇧🇷', // Brazil flag for SA
        Region.europe => '🇪🇺', // EU flag
        Region.asia => '🇯🇵', // JP flag for Asia
        Region.oceania => '🇦🇺', // AU flag for Oceania
      };

  /// Returns the theme color associated with the region.
  Color get color => switch (this) {
        Region.northAmerica => AppColors.primary,
        Region.southAmerica => AppColors.accent,
        Region.europe => const Color(0xFF00FF9D),
        Region.asia => const Color(0xFFFF0055),
        Region.oceania => const Color(0xFFFF9900),
      };

  /// Returns the current time in the region (using a representative time zone).
  DateTime get currentTime {
    final now = DateTime.now().toUtc();
    return now.add(timeZoneOffset);
  }

  /// Returns the UTC offset for a representative time zone in the region.
  Duration get timeZoneOffset => switch (this) {
        Region.northAmerica => const Duration(hours: -5), // EST
        Region.southAmerica => const Duration(hours: -3), // BRT
        Region.europe => const Duration(hours: 1), // CET
        Region.asia => const Duration(hours: 9), // JST
        Region.oceania => const Duration(hours: 11), // AEDT
      };
}

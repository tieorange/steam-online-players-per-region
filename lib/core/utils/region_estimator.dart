import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegionEstimator {
  // Region timezone offsets (approximate center)
  static const Map<Region, int> regionUtcOffsets = {
    Region.europe: 1, // CET (Central European Time)
    Region.northAmerica: -5, // EST (Eastern Standard Time)
    Region.asia: 8, // CST (China Standard Time)
    Region.southAmerica: -3, // BRT (Brasília Time)
    Region.oceania: 10, // AEST (Australian Eastern)
  };

  // Base distribution percentages (from market research / Steam regional data)
  static const Map<Region, double> baseDistribution = {
    Region.europe: 0.35, // 35% - Largest PC gaming market
    Region.northAmerica: 0.30, // 30% - Strong extraction shooter fanbase
    Region.asia: 0.20, // 20% - Growing but less PC-focused
    Region.southAmerica: 0.10, // 10% - Emerging market
    Region.oceania: 0.05, // 5%  - Smaller but dedicated
  };

  /// Calculate activity multiplier based on local time
  /// Returns 0.2 - 1.0 based on how close to prime time (19:00-22:00 local)
  double getActivityMultiplier(Region region, DateTime utcNow) {
    final localHour = (utcNow.hour + regionUtcOffsets[region]!) % 24;

    // Prime time: 18-23 (multiplier 1.0)
    // Secondary: 12-18, 23-01 (multiplier 0.6)
    // Off-peak: 01-08 (multiplier 0.2)
    // Morning: 08-12 (multiplier 0.4)

    if (localHour >= 18 && localHour <= 23) return 1;
    if (localHour >= 23 || localHour <= 1) return 0.6;
    if (localHour >= 12 && localHour < 18) return 0.6;
    if (localHour >= 8 && localHour < 12) return 0.4;
    return 0.2; // 01-08 deep night
  }

  /// Day of week modifier (weekends = higher activity)
  double getDayOfWeekMultiplier(DateTime utcNow) {
    final weekday = utcNow.weekday;
    if (weekday == DateTime.saturday || weekday == DateTime.sunday) {
      return 1.2;
    }
    if (weekday == DateTime.friday) {
      return 1.1;
    }
    return 1;
  }

  /// Main estimation method
  Map<Region, int> estimateRegionalDistribution(int totalPlayers, DateTime utcNow) {
    final weights = <Region, double>{};
    double totalWeight = 0;

    for (final region in Region.values) {
      final baseWeight = baseDistribution[region]!;
      final timeMultiplier = getActivityMultiplier(region, utcNow);
      final dayMultiplier = getDayOfWeekMultiplier(utcNow);

      final weight = baseWeight * timeMultiplier * dayMultiplier;
      weights[region] = weight;
      totalWeight += weight;
    }

    // Normalize and calculate player counts
    final result = <Region, int>{};
    for (final region in Region.values) {
      final normalizedWeight = weights[region]! / totalWeight;
      result[region] = (totalPlayers * normalizedWeight).round();
    }

    return result;
  }
}

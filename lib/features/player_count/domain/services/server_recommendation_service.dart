import 'dart:math';

import 'package:arc_raiders_tracker/features/player_count/domain/entities/playstyle.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:arc_raiders_tracker/features/player_count/domain/entities/server_recommendation.dart';

class ServerRecommendationService {
  List<ServerRecommendation> getRecommendations({
    required RegionalDistribution distribution,
    required DateTime currentTime,
  }) {
    final utcTime = currentTime.toUtc();
    final pvpRecommendation = _getBestRegionFor(
      Playstyle.pvp,
      distribution.distribution,
      utcTime,
    );
    final pveRecommendation = _getBestRegionFor(
      Playstyle.pve,
      distribution.distribution,
      utcTime,
    );

    return [pvpRecommendation, pveRecommendation];
  }

  ServerRecommendation _getBestRegionFor(
    Playstyle playstyle,
    Map<Region, int> distribution,
    DateTime utcTime,
  ) {
    var bestRegion = Region.europe;
    var bestScore = -1.0;
    var bestReason = '';

    for (final region in Region.values) {
      final playerCount = distribution[region] ?? 0;
      if (playerCount == 0) continue;

      var score = 0.0;
      final reasons = <String>[];

      // 1. Player Count Factor (Logarithmic to prevent massive regions from dominating)
      // log(100) ≈ 4.6, log(1000) ≈ 6.9, log(10000) ≈ 9.2, log(100000) ≈ 11.5
      score += (playerCount > 100) ? log(playerCount.toDouble()) : 0;

      // 2. Time of Day Factor (Peak hours 18:00 - 00:00)
      final localHour = _getLocalHour(region, utcTime);
      final isPeak = localHour >= 18 && localHour < 24;
      final isActive = localHour >= 9 && localHour < 24;

      if (isPeak) {
        score *= 1.2; // Reduced from 1.5 to not overshadow culture
        reasons.add('Peak hours');
      } else if (isActive) {
        score *= 1.1;
      } else {
        score *= 0.8; // Off-hours penalty
        reasons.add('Off-peak');
      }

      // 3. Cultural/Regional Factor (Stronger weights)
      if (playstyle == Playstyle.pvp) {
        if (region == Region.southAmerica) {
          score *= 1.5; // High aggression
          reasons.add('Aggressive playstyle');
        } else if (region == Region.europe) {
          score *= 1.3; // Mixed/High aggression
          reasons.add('High population');
        } else if (region == Region.northAmerica) {
          score *= 0.8; // Too friendly for pure PVP
        }
      } else {
        // PVE
        if (region == Region.northAmerica) {
          score *= 1.6; // Strong boost for friendliness
          reasons.add('Friendly community');
        } else if (region == Region.oceania) {
          score *= 1.4; // Chill
          reasons.add('Relaxed servers');
        } else if (region == Region.europe) {
          score *= 0.9; // Slight penalty for PVE due to mixed nature
        } else if (region == Region.southAmerica) {
          score *= 0.5; // Avoid SA for PVE
        }
      }

      if (score > bestScore) {
        bestScore = score;
        bestRegion = region;
        bestReason = reasons.isNotEmpty ? reasons.join(', ') : 'High activity';
      }
    }

    return ServerRecommendation(
      recommendedRegion: bestRegion,
      playstyle: playstyle,
      reason: bestReason,
      estimatedPlayers: distribution[bestRegion] ?? 0,
      score: bestScore,
    );
  }

  int _getLocalHour(Region region, DateTime utcTime) {
    var offset = 0;
    switch (region) {
      case Region.europe:
        offset = 1; // CET approx
      case Region.northAmerica:
        offset = -5; // EST approx
      case Region.southAmerica:
        offset = -3; // BRT approx
      case Region.asia:
        offset = 9; // JST approx
      case Region.oceania:
        offset = 11; // AEDT approx
    }
    final local = utcTime.add(Duration(hours: offset));
    return local.hour;
  }
}

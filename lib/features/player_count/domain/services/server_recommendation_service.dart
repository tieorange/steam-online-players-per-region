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

      double score = 0.0;
      final reasons = <String>[];

      // 1. Player Count Factor (normalized against total)
      // Logarithmic scale because 20k vs 40k matters less than 100 vs 2000
      score += (playerCount > 0 ? playerCount : 0) / 10000;

      // 2. Time of Day Factor (Peak hours 18:00 - 00:00)
      final localHour = _getLocalHour(region, utcTime);
      final isPeak = localHour >= 18 && localHour < 24;
      final isActive = localHour >= 10 && localHour < 24;

      if (isPeak) {
        score *= 1.5;
        reasons.add('Peak hours');
      } else if (isActive) {
        score *= 1.2;
      } else {
        score *= 0.8; // Off-hours penalty
        reasons.add('Off-peak');
      }

      // 3. Cultural/Regional Factor
      if (playstyle == Playstyle.pvp) {
        if (region == Region.southAmerica) {
          score *= 1.4; // High aggression
          reasons.add('Aggressive playstyle');
        } else if (region == Region.europe) {
          score *= 1.2; // Mixed/High aggression
          reasons.add('High population');
        } else if (region == Region.northAmerica) {
          score *= 0.9; // Too friendly for pure PVP
        }
      } else {
        // PVE
        if (region == Region.northAmerica) {
          score *= 1.4; // Communicative/Friendly
          reasons.add('Friendly community');
        } else if (region == Region.oceania) {
          score *= 1.2; // Chill
          reasons.add('Relaxed servers');
        } else if (region == Region.southAmerica) {
          score *= 0.6; // Avoid SA for PVE
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
    int offset = 0;
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

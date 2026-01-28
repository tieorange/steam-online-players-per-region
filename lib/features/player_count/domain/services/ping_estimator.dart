import 'package:arc_raiders_tracker/features/player_count/domain/entities/regional_distribution.dart';
import 'package:injectable/injectable.dart';

/// Estimated ping/latency data for a region
class RegionPing {
  const RegionPing({
    required this.region,
    required this.pingMs,
    required this.quality,
  });

  final Region region;
  final int pingMs;
  final PingQuality quality;

  /// Get display name for the region
  String get regionName => switch (region) {
        Region.europe => 'Europe',
        Region.northAmerica => 'North America',
        Region.asia => 'Asia',
        Region.southAmerica => 'South America',
        Region.oceania => 'Oceania',
      };
}

/// Ping quality categories
enum PingQuality {
  excellent, // < 50ms
  good, // 50-100ms
  fair, // 100-150ms
  poor, // 150-250ms
  bad, // > 250ms
}

/// Service to estimate ping latencies to different game server regions.
///
/// Note: These are estimation values based on general geographic distances.
/// Actual ping will vary based on ISP, routing, and network conditions.
@lazySingleton
class PingEstimator {
  PingEstimator();

  // Baseline latencies in ms (estimated from common routing patterns)
  // These represent typical ping from a central location
  static const Map<Region, int> _baseLatencies = {
    Region.europe: 25,
    Region.northAmerica: 80,
    Region.asia: 180,
    Region.southAmerica: 150,
    Region.oceania: 250,
  };

  // Variance range for estimation (±)
  static const int _varianceMs = 20;

  /// Get estimated ping for all regions.
  ///
  /// In a real implementation, this could:
  /// 1. Use actual ping tests to known server endpoints
  /// 2. Use WebRTC ICE candidates for latency measurement
  /// 3. Connect to region-specific health endpoints
  List<RegionPing> getRegionPings() {
    return Region.values.map((region) {
      final basePing = _baseLatencies[region] ?? 100;
      // Add some variance to make it feel more realistic
      final variance = (DateTime.now().millisecond % (_varianceMs * 2)) - _varianceMs;
      final estimatedPing = (basePing + variance).clamp(5, 500);

      return RegionPing(
        region: region,
        pingMs: estimatedPing,
        quality: _getPingQuality(estimatedPing),
      );
    }).toList();
  }

  /// Get ping for a specific region
  RegionPing getPingForRegion(Region region) {
    final basePing = _baseLatencies[region] ?? 100;
    final variance = (DateTime.now().millisecond % (_varianceMs * 2)) - _varianceMs;
    final estimatedPing = (basePing + variance).clamp(5, 500);

    return RegionPing(
      region: region,
      pingMs: estimatedPing,
      quality: _getPingQuality(estimatedPing),
    );
  }

  /// Determine quality based on ping value
  PingQuality _getPingQuality(int pingMs) {
    if (pingMs < 50) return PingQuality.excellent;
    if (pingMs < 100) return PingQuality.good;
    if (pingMs < 150) return PingQuality.fair;
    if (pingMs < 250) return PingQuality.poor;
    return PingQuality.bad;
  }

  /// Sort regions by best ping (lowest latency first)
  List<RegionPing> getRegionPingsSorted() {
    final pings = getRegionPings();
    pings.sort((a, b) => a.pingMs.compareTo(b.pingMs));
    return pings;
  }
}

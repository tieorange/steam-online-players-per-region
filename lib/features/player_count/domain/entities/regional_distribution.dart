import 'package:freezed_annotation/freezed_annotation.dart';

part 'regional_distribution.freezed.dart';

enum Region { europe, northAmerica, asia, southAmerica, oceania }

@freezed
class RegionalDistribution with _$RegionalDistribution {
  const factory RegionalDistribution({
    required Map<Region, int> distribution,
    required DateTime calculatedAt,
    required bool isEstimate,
  }) = _RegionalDistribution;

  factory RegionalDistribution.empty() => RegionalDistribution(
    distribution: {for (var r in Region.values) r: 0},
    calculatedAt: DateTime.now(),
    isEstimate: false,
  );
}

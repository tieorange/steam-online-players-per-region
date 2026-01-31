import 'package:arc_raiders_tracker/features/player_count/domain/entities/hourly_forecast.dart';
import 'package:injectable/injectable.dart';

@injectable
class PeakTimeCalculator {
  /// Returns a list of 24 hourly activity scores (0.0 to 1.0) starting from current hour
  List<HourlyForecast> getForecastForNext24Hours() {
    final now = DateTime.now().toUtc();
    final forecast = <HourlyForecast>[];

    for (int i = 0; i < 24; i++) {
      final time = now.add(Duration(hours: i));
      final hour = time.hour;

      // Heuristic model based on Steam global concurrent users curve
      // Peaks around 14:00 - 20:00 UTC (European evening + Asian late night)
      // Trough around 02:00 - 08:00 UTC (US late night / Asian morning)

      double score = 0.5;

      if (hour >= 13 && hour <= 21) {
        // High activity window (EU active, Asia ending)
        score = 0.8 + (hour == 16 || hour == 17 ? 0.2 : 0); // Peak at 16-17 UTC
      } else if (hour >= 2 && hour <= 9) {
        // Low activity window
        score = 0.2 + (hour == 5 || hour == 6 ? -0.1 : 0.0); // Lowest at 5-6 UTC
      } else {
        // Transition
        score = 0.5;
      }

      forecast.add(HourlyForecast(time: time, activityScore: score));
    }

    return forecast;
  }
}

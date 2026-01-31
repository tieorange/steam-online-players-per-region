import 'dart:async';
import 'dart:math';

/// simple retry policy for async operations
class RetryPolicy {
  final int maxAttempts;
  final Duration initialDelay;
  final double backoffFactor;

  const RetryPolicy({
    this.maxAttempts = 3,
    this.initialDelay = const Duration(seconds: 1),
    this.backoffFactor = 2.0,
  });

  Future<T> execute<T>(Future<T> Function() operation) async {
    int attempt = 0;
    while (true) {
      try {
        attempt++;
        return await operation();
      } catch (e) {
        if (attempt >= maxAttempts) {
          rethrow;
        }

        final delay = initialDelay * pow(backoffFactor, attempt - 1);
        await Future<void>.delayed(delay);
      }
    }
  }
}

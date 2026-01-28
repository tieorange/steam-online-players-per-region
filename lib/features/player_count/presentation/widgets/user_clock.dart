import 'dart:async';

import 'package:arc_raiders_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserClock extends StatefulWidget {
  const UserClock({super.key});

  @override
  State<UserClock> createState() => _UserClockState();
}

class _UserClockState extends State<UserClock> {
  late DateTime _now;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final timeString = DateFormat('HH:mm').format(_now);
    final secondsString = DateFormat('ss').format(_now);
    final dateString = DateFormat('EEEE, d MMMM').format(_now);
    final timeZone = _now.timeZoneName;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.public, size: 12, color: AppColors.textTertiary.withValues(alpha: 0.7)),
            const SizedBox(width: 6),
            Text(
              'LOCAL TIME ($timeZone)',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.textTertiary,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              timeString,
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w200,
                color: AppColors.textPrimary,
                letterSpacing: -2,
                height: 1,
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.5),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: Text(
                ':$secondsString',
                key: ValueKey<String>(secondsString),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  color: AppColors.primary.withValues(alpha: 0.8),
                  letterSpacing: -1,
                ),
              ),
            ),
          ],
        ),
        Text(
          dateString.toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
                letterSpacing: 4,
              ),
        ),
      ],
    );
  }
}

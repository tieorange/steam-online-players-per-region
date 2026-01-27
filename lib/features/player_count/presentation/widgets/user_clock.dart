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
    final timeString = DateFormat('HH:mm:ss').format(_now);
    final dateString = DateFormat('EEEE, d MMMM').format(_now);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'YOUR LOCAL TIME',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: AppColors.textTertiary,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          timeString,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w200,
            color: AppColors.textPrimary,
            letterSpacing: -1,
            height: 1,
          ),
        ),
        Text(
          dateString.toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../core/di/injection.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Dependency Injection
  await configureDependencies();

  runApp(const ArcRaidersTrackerApp());
}

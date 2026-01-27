import 'package:arc_raiders_tracker/app.dart';
import 'package:arc_raiders_tracker/core/di/injection.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Initialize Dependency Injection
  await configureDependencies();

  runApp(const ArcRaidersTrackerApp());
}

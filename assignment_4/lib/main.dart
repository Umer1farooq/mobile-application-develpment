import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'lib/app.dart' as app;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final cacheBox = await Hive.openBox<String>('activity_cache');

  runApp(app.SmartTrackerApp(cacheBox: cacheBox));
}

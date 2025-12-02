import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'models/activity.dart';
import 'services/api_service.dart';
import 'repositories/activity_repository.dart';
import 'providers/activity_provider.dart';
import 'screens/home_screen.dart';

class SmartTrackerApp extends StatelessWidget {
  final Box<String> cacheBox;
  SmartTrackerApp({required this.cacheBox});

  @override
  Widget build(BuildContext context) {
    final api = ApiService(baseUrl: 'http://10.0.2.2:3000');
    final repo = ActivityRepository(apiService: api, cacheBox: cacheBox);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ActivityProvider(repo: repo)),
      ],
      child: MaterialApp(
        title: 'SmartTracker',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}

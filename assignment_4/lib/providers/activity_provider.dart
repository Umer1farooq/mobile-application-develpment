import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../repositories/activity_repository.dart';

class ActivityProvider extends ChangeNotifier {
  final ActivityRepository repo;
  List<Activity> _activities = [];
  bool _loading = false;

  ActivityProvider({required this.repo});

  List<Activity> get activities => _activities;
  bool get loading => _loading;

  Future<void> loadActivities() async {
    _loading = true;
    notifyListeners();
    try {
      final remote = await repo.getRemoteActivities();
      _activities = remote;
    } catch (e) {
      // fallback to cache
      _activities = repo.getCachedActivities();
    }
    _loading = false;
    notifyListeners();
  }

  Future<void> addActivity(Activity a) async {
    _activities.insert(0, a);
    notifyListeners();
    try {
      final created = await repo.addActivity(a);
      // replace if server returns different id
      _activities[0] = created;
    } catch (e) {
      // offline: cached already by repository when attempted
    }
    notifyListeners();
  }

  Future<void> deleteActivity(String id) async {
    _activities.removeWhere((x) => x.id == id);
    notifyListeners();
    try {
      await repo.deleteActivity(id);
    } catch (e) {
      // if offline, ensure cache removal
    }
  }
}

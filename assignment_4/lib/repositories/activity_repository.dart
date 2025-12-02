import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../models/activity.dart';
import '../services/api_service.dart';

class ActivityRepository {
  final ApiService apiService;
  final Box<String> cacheBox; // store raw json strings

  ActivityRepository({required this.apiService, required this.cacheBox});

  Future<List<Activity>> getRemoteActivities() => apiService.fetchActivities();

  Future<Activity> addActivity(Activity activity) async {
    final created = await apiService.createActivity(activity);
    await _cacheAdd(created);
    return created;
  }

  Future<void> deleteActivity(String id) async {
    await apiService.deleteActivity(id);
    await _cacheRemove(id);
  }

  // Offline cache: keep latest 5
  Future<void> _cacheAdd(Activity a) async {
    final entries = cacheBox.values.toList();
    cacheBox.put(a.id, a.toRawJson());
    if (cacheBox.length > 5) {
      // remove oldest by timestamp
      final parsed =
          cacheBox.values.map((s) => Activity.fromRawJson(s)).toList()
            ..sort((x, y) => x.timestamp.compareTo(y.timestamp));
      // remove earliest until length ==5
      while (cacheBox.length > 5) {
        final oldest = parsed.removeAt(0);
        cacheBox.delete(oldest.id);
      }
    }
  }

  Future<void> _cacheRemove(String id) async => cacheBox.delete(id);

  List<Activity> getCachedActivities() {
    return cacheBox.values.map((s) => Activity.fromRawJson(s)).toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }
}

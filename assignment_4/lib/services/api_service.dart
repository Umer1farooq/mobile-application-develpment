import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/activity.dart';

class ApiService {
  final String baseUrl;
  ApiService({required this.baseUrl});

  Future<List<Activity>> fetchActivities() async {
    final res = await http.get(Uri.parse('$baseUrl/activities'));
    if (res.statusCode == 200) {
      final data = json.decode(res.body) as List;
      return data.map((e) => Activity.fromJson(e)).toList();
    }
    throw Exception('Failed to fetch activities');
  }

  Future<Activity> createActivity(Activity activity) async {
    final res = await http.post(
      Uri.parse('$baseUrl/activities'),
      headers: {'Content-Type': 'application/json'},
      body: activity.toRawJson(),
    );
    if (res.statusCode == 201) return Activity.fromJson(json.decode(res.body));
    throw Exception('Failed to create activity');
  }

  Future<void> deleteActivity(String id) async {
    final res = await http.delete(Uri.parse('$baseUrl/activities/$id'));
    if (res.statusCode != 200) throw Exception('Failed to delete');
  }
}

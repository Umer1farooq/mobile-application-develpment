import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/activity_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ActivityProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('History')),
      body: prov.loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: prov.activities.length,
              itemBuilder: (_, i) {
                final a = prov.activities[i];
                return ListTile(
                  leading: a.imagePath.isNotEmpty
                      ? Image.file(
                          File(a.imagePath),
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                        )
                      : null,
                  title: Text(
                    '${a.latitude.toStringAsFixed(5)}, ${a.longitude.toStringAsFixed(5)}',
                  ),
                  subtitle: Text(a.timestamp.toLocal().toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => prov.deleteActivity(a.id),
                  ),
                );
              },
            ),
    );
  }
}

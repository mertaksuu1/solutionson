import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  final List<Map<String, String>> achievements = [
    {'title': 'Donation Star', 'description': 'Donated 100 TL'},
    {'title': 'Super Donator', 'description': 'Donated 1000 TL'},
    // Diğer rozetleri buraya ekleyebilirsiniz
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Achievements'),
      ),
      body: ListView.builder(
        itemCount: achievements.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(achievements[index]['title'] ?? ''),
              subtitle: Text(achievements[index]['description'] ?? ''),
              leading: Icon(Icons.star_border), // Rozet simgesi
            ),
          );
        },
      ),
    );
  }
}

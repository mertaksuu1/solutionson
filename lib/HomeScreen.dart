import 'package:flutter/material.dart';
import 'RegistrationScreen.dart';
import 'CreateCampaignScreen.dart';
import 'AboutUsScreen.dart';
import 'CommunityScreen.dart';
import 'AchievementsScreen.dart'; // Yeni eklenen satır

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> donations = [
    {'title': 'Donation 1', 'description': 'Description about donation 1', 'progress': 20.0},
    {'title': 'Donation 2', 'description': 'Description about donation 2', 'progress': 75.0},
    {'title': 'Donation 3', 'description': 'Description about donation 3', 'progress': 30.0},
    {'title': 'Donation 4', 'description': 'Description about donation 4', 'progress': 90.0},
    {'title': 'Donation 5', 'description': 'Description about donation 5', 'progress': 60.0},
  ];

  List<bool> isOpenList = List.generate(5, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrationScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AchievementsScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Donations',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: donations.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(donations[index]['title']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(donations[index]['description']),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'Completed: ${donations[index]['progress']}%',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        LinearProgressIndicator(
                          value: donations[index]['progress'] / 100,
                        ),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // "Bağış Yap" butonuna tıklama işlemleri burada eklenebilir.
                      },
                      child: Text('Donate Now'),
                    ),
                    onTap: () {
                      setState(() {
                        isOpenList[index] = !isOpenList[index];
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 137, 133, 246),
              ),
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              title: Text('About Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Community'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Achievements'), // Yeni eklenen satır
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AchievementsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateCampaignScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

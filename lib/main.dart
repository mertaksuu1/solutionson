import 'package:flutter/material.dart';
import 'RegistrationScreen.dart';
import 'CreateCampaignScreen.dart';
import 'HomeScreen.dart';
import 'CommunityScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Azaltılmış Eşitsizlik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'bottom_navbar.dart';

class MoodTrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mood Tracker")),
      body: Center(child: Text("Mood Tracker Page Content Here")),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1, onItemTapped: (index) {}),
    );
  }
}

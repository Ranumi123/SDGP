import 'package:flutter/material.dart';
import 'bottom_navbar.dart';

class ChatForumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chat Forum")),
      body: Center(child: Text("Chat Forum Page Content Here")),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1, onItemTapped: (index) {}),
    );
  }
}

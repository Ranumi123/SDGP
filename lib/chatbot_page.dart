import 'package:flutter/material.dart';
import 'bottom_navbar.dart';

class ChatbotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chatbot")),
      body: Center(child: Text("Chatbot Page Content Here")),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1, onItemTapped: (index) {}),
    );
  }
}

import 'package:flutter/material.dart';
import 'home_page.dart'; // Import home page
import 'chatbot_page.dart'; // Create Chatbot Page separately
import 'chatforum_page.dart'; // Create Chat Forum Page separately
import 'moodtracker_page.dart'; // Create Mood Tracker Page separately

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MindBridge',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/chatbot': (context) => ChatbotPage(),
        '/chatforum': (context) => ChatForumPage(),
        '/moodtracker': (context) => MoodTrackerPage(),
      },
    );
  }
}

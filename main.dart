import 'package:flutter/material.dart';
import 'welcome_page.dart'; // Import the welcome page
import 'login_page.dart'; // Import the login page
import 'signup_page.dart'; // Import the signup page
import 'privacy_setting_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serenity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(), // Set the welcome page as the home
      routes: {
        '/home': (context) => HomePage(), // Define the route for the home page
        '/login': (context) => LoginPage(), // Define the route for the login page
        '/signup': (context) => SignupPage(),
        '/settings': (context) => PrivacySettingsPage()// Define the route for the signup page
      },
    );
  }
}

// Placeholder for the HomePage
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}
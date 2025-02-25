import 'package:flutter/material.dart';
import 'welcome_page.dart'; // Import the welcome page
import 'login_page.dart'; // Import the login page
import 'signup_page.dart'; // Import the signup page
import 'privacy_setting_page.dart'; // Import the privacy settings page
import 'chat_screen.dart'; // Import the new chatbot screen
import 'profile_setup_screen.dart'; // Import the new profile page

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
        '/signup': (context) => SignupPage(), // Define the route for the signup page
        '/settings': (context) => PrivacySettingsPage(), // Define the route for the privacy settings page
        '/chat': (context) => ChatScreen(), // Define the route for the chatbot screen
        '/profile': (context) => ProfilePage(), // Define the route for the profile page
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Home Page!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Chatbot Screen
                Navigator.pushNamed(context, '/chat');
              },
              child: Text('Open Chatbot'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Profile Page
                Navigator.pushNamed(context, '/profile');
              },
              child: Text('Go to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
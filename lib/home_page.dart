import 'package:flutter/material.dart';
import 'bottom_navbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.pushNamed(context, '/feed');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color set to white
      appBar: AppBar(
        backgroundColor: Colors.white, // AppBar white color
        elevation: 0, // No shadow
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black), // Black menu icon
          onPressed: () {
            // Add your menu action here
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'), // Replace with your logo
              radius: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  // ✅ FIX: Added scrolling to prevent overflow
          child: Column(
            children: [
              // Centered Welcome Message
              Column(
                children: [
                  Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Your mental wellness journey starts here!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Centered Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/welcome_image.png',
                    width: 180, // Increased size
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Feature Cards (Chatbot, Chat Forum, Mood Tracker)
              Column( // ✅ FIX: Removed `Expanded` to prevent overflow
                children: [
                  // First Row: Chatbot & Chat Forum
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildFeatureCard("Chatbot", "assets/images/chatbot.png", "/chatbot"),
                      _buildFeatureCard("Chat Forum", "assets/images/chat_forum.png", "/chatforum"),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Centered Mood Tracker Card
                  Center(
                    child: _buildFeatureCard("Mood Tracker", "assets/images/mood_tracker.png", "/moodtracker"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  // Widget for Feature Cards
  Widget _buildFeatureCard(String title, String imagePath, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        color: Colors.white,
        child: Container(
          width: 150, // Adjust width for layout balance
          height: 170, // Adjust height
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

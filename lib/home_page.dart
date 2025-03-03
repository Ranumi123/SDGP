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
      backgroundColor: Color(0xFFF5EFE5), // Match the theme
      appBar: AppBar(
        title: Text('MindBridge'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Centered Welcome Message
            Column(
              children: [
                Text(
                  "Welcome to MindBridge!",
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
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(top: 10),
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  List<Map<String, String>> features = [
                    {"title": "Chatbot", "image": "assets/images/chatbot.png", "route": "/chatbot"},
                    {"title": "Chat Forum", "image": "assets/images/chat_forum.png", "route": "/chatforum"},
                    {"title": "Mood Tracker", "image": "assets/images/mood_tracker.png", "route": "/moodtracker"},
                  ];

                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, features[index]["route"]!),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(features[index]["image"]!, fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              features[index]["title"]!,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Feed'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2DABCA),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF316FCA),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      home: MoodTrackerScreen(),
    );
  }
}

class MoodTrackerScreen extends StatefulWidget {
  @override
  _MoodTrackerScreenState createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  final TextEditingController _textController = TextEditingController();
  String? selectedMood;
  final List<String> moodOptions = ["😢", "😞", "😐", "😊", "😄"];
  int _selectedIndex = 0;
  bool _showGif = false;

  void _saveMood() {
    if (selectedMood == null && _textController.text.trim().isEmpty) return;

    // Display the GIF when the submit button is pressed
    setState(() {
      _showGif = true;
    });

    // Simulate a delay before hiding the GIF (e.g., after the "mood saved" message)
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showGif = false;
      });
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Mood saved!")));
    setState(() {
      selectedMood = null;
      _textController.clear();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mood Tracker"),
        backgroundColor: Color(0xFF2DABCA),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Text("How are you feeling today?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Wrap(
              spacing: 15, runSpacing: 15, alignment: WrapAlignment.center,
              children: moodOptions.map((mood) => ElevatedButton(
                onPressed: () => setState(() => selectedMood = mood),
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedMood == mood ? Color(0xFF3CDFCA) : Colors.transparent,
                  side: BorderSide(color: selectedMood == mood ? Colors.blueAccent : Colors.transparent, width: 2),
                  minimumSize: Size(60, 60),
                ),
                child: Text(mood, style: TextStyle(fontSize: 30)),
              )).toList(),
            ),
            SizedBox(height: 20),
            Text("Express yourself in words ✨", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _textController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
                  hintText: "Type your feelings here...",
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _saveMood, child: Text("Submit")),
            SizedBox(height: 20),
            if (_showGif)
              Center(
                child: Image.asset('assets/thumbs_up.gif'), // Use Image.asset for displaying the GIF
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
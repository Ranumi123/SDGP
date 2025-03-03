import 'package:flutter/material.dart';
import 'dart:async';

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

  void _saveMood() {
    if (selectedMood == null && _textController.text.trim().isEmpty) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GifScreen()),
    );

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
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.center,
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
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Type your feelings here...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _saveMood, child: Text("Submit")),
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

class GifScreen extends StatefulWidget {
  @override
  _GifScreenState createState() => _GifScreenState();
}

class _GifScreenState extends State<GifScreen> {
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _opacity = 0.0;
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 1),
          child: Image.asset('assets/thumbs_up.gif', width: 200, height: 200),
        ),
      ),
    );
  }
}

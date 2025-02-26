import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MeditationScreen(),
    );
  }
}

class MeditationScreen extends StatelessWidget {
  const MeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text("Evenings Meditation"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: _buildFilterButton("Sort")),
                const SizedBox(width: 8),
                Expanded(child: _buildFilterButton("Length")),
                const SizedBox(width: 8),
                Expanded(child: _buildFilterButton("1 Filter")),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: _meditationSessions.map((session) => _buildSessionCard(session)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildFilterButton(String text) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
    onPressed: () {},
    child: Text(text, style: const TextStyle(color: Colors.white)),
  );
}

Widget _buildSessionCard(Map<String, String> session) {
  return Card(
    color: Colors.black,
    child: ListTile(
      leading: Image.network(session['image']!, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(session['title']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Text("${session['duration']} min Guided\n⭐ ${session['rating']} • ${session['author']}",
          style: TextStyle(color: Colors.grey[400])),
      trailing: const Icon(Icons.bookmark_border, color: Colors.white),
    ),
  );
}

final List<Map<String, String>> _meditationSessions = [
  {
    "title": "Yoga Nidra For Sleep",
    "duration": "22",
    "rating": "4.7",
    "author": "Jennifer Piercy",
    "image": "https://unsplash.com/photos/woman-sitting-on-bench-over-viewing-mountain-HS5CLnQbCOc"
  },
  {
    "title": "Deep Sleep Guided Meditation",
    "duration": "61",
    "rating": "4.7",
    "author": "Kenneth Soares",
    "image": "https://source.unsplash.com/100x100/?night"
  },
  {
    "title": "Breathing Into Sleep",
    "duration": "18",
    "rating": "4.7",
    "author": "Bethany Auriel-Hagan",
    "image": "https://source.unsplash.com/100x100/?stars"
  },
  {
    "title": "Peaceful Sleep Meditation",
    "duration": "35",
    "rating": "4.6",
    "author": "Aluna Moon",
    "image": "https://source.unsplash.com/100x100/?calm"
  },
];

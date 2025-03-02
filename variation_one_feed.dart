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
        title: const Text("Evening Meditation"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: _buildFilterButton("Sort", Icons.sort)),
                const SizedBox(width: 8),
                Expanded(child: _buildFilterButton("Length", Icons.timer)),
                const SizedBox(width: 8),
                Expanded(child: _buildFilterButton("1 Filter", Icons.filter_alt)),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _meditationSessions.length,
                itemBuilder: (context, index) {
                  return _buildSessionCard(_meditationSessions[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

Widget _buildFilterButton(String text, IconData icon) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
    onPressed: () {},
    icon: Icon(icon, color: Colors.white),
    label: Text(text, style: const TextStyle(color: Colors.white)),
  );
}

Widget _buildSessionCard(Map<String, String> session) {
  return Card(
    color: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: Image.network(session['image']!, height: 80, width: double.infinity, fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(session['title']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text("${session['duration']} min • ⭐ ${session['rating']}",
                  style: TextStyle(color: Colors.grey[400]))
            ],
          ),
        ),
      ],
    ),
  );
}

final List<Map<String, String>> _meditationSessions = [
  {
    "title": "Yoga Nidra For Sleep",
    "duration": "22",
    "rating": "4.7",
    "author": "Jennifer Piercy",
    "image": "https://source.unsplash.com/100x100/?autumn"
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

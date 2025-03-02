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
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterButton("Sort", Icons.sort),
                _buildFilterButton("Length", Icons.timer),
                _buildFilterButton("Filters", Icons.filter_alt),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _meditationSessions.length,
                itemBuilder: (context, index) {
                  return _buildSessionCard(_meditationSessions[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueGrey,
        onPressed: () {},
        label: const Text("Add Session"),
        icon: const Icon(Icons.add),
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
  return TextButton.icon(
    onPressed: () {},
    icon: Icon(icon, color: Colors.white),
    label: Text(text, style: const TextStyle(color: Colors.white)),
  );
}

Widget _buildSessionCard(Map<String, String> session) {
  return Card(
    color: Colors.grey[900],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(session['image']!, width: 60, height: 60, fit: BoxFit.cover),
      ),
      title: Text(session['title']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Text("${session['duration']} min • ⭐ ${session['rating']}\nBy ${session['author']}",
          style: TextStyle(color: Colors.grey[400])),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.play_arrow, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
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

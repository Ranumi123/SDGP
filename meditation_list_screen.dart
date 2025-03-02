import 'package:flutter/material.dart';
import '../models/meditation_model.dart';
import 'meditation_detail_screen.dart';

class MeditationListScreen extends StatelessWidget {
  const MeditationListScreen({super.key});

  final List<Meditation> meditations = const [
    Meditation(
        title: "Yoga Nidra For Sleep",
        duration: "22 min",
        rating: 4.7,
        author: "Jennifer Piercy"),
    Meditation(
        title: "Deep Sleep Guided Meditation",
        duration: "61 min",
        rating: 4.7,
        author: "Kenneth Soares"),
    Meditation(
        title: "Breathing Into Sleep",
        duration: "18 min",
        rating: 4.7,
        author: "Bethany Auriel-Hagan"),
    Meditation(
        title: "Peaceful Sleep Meditation",
        duration: "35 min",
        rating: 4.6,
        author: "Aluna Moon"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Evenings Meditation',
            style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          // Filter buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterButton('Sort'),
                _buildFilterButton('Length'),
                _buildFilterButton('1 Filter'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: meditations.length,
              itemBuilder: (context, index) {
                final meditation = meditations[index];
                return _buildMeditationCard(context, meditation);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Function to build filter buttons
  Widget _buildFilterButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      child: Text(text),
    );
  }

  // Function to build meditation cards with hover effect
  Widget _buildMeditationCard(BuildContext context, Meditation meditation) {
    return MouseRegion(
      cursor: SystemMouseCursors.click, // Changes cursor to pointer
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MeditationDetailScreen(meditation: meditation),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12),
          ),
          child: MouseRegion(
            onEnter: (event) => _onHover(true, context, meditation),
            onExit: (event) => _onHover(false, context, meditation),
            child: Row(
              children: [
                // Meditation image placeholder with play button
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://via.placeholder.com/80', // Replace with real image URL
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 25,
                      left: 25,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(Icons.play_arrow, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                // Meditation details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meditation.duration + ' Guided',
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        child: Text(meditation.title),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '⭐ ${meditation.rating}  ${meditation.author}',
                        style: TextStyle(color: Colors.grey[400], fontSize: 14),
                      ),
                    ],
                  ),
                ),
                // Bookmark icon
                IconButton(
                  icon: const Icon(Icons.bookmark_border, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Hover effect function
  void _onHover(bool isHovering, BuildContext context, Meditation meditation) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.hideCurrentSnackBar();
    if (isHovering) {
      scaffold.showSnackBar(
        SnackBar(
          content: Text('Click to view details: ${meditation.title}'),
          duration: const Duration(milliseconds: 800),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.grey[800],
        ),
      );
    }
  }
}

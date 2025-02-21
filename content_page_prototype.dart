import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ContentPage()));
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Content',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Filter",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Post List
            Expanded(
              child: ListView(
                children: [
                  postCard(
                    imageUrl:
                        'https://via.placeholder.com/300', // Replace with actual image URL
                    username: 'Helena in Group Name',
                    description: 'Post description',
                    timeAgo: '3m ago',
                    likes: 21,
                    comments: 4,
                  ),
                  SizedBox(height: 10),
                  postCard(
                    imageUrl: 'https://via.placeholder.com/300', // Another post
                    username: 'Another User',
                    description: 'Second post description',
                    timeAgo: '10m ago',
                    likes: 10,
                    comments: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget postCard({
    required String imageUrl,
    required String username,
    required String description,
    required String timeAgo,
    required int likes,
    required int comments,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),

            // User Name & Group
            Text(
              username,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(description, style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 4),
            Text(timeAgo, style: TextStyle(color: Colors.grey, fontSize: 12)),
            SizedBox(height: 8),

            // Like & Comment Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border, size: 20),
                    SizedBox(width: 4),
                    Text("$likes likes"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.comment_outlined, size: 20),
                    SizedBox(width: 4),
                    Text("$comments comments"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

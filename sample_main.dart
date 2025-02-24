import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// Root of the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Combined Feed & Content',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FeedPage(),
    );
  }
}

/// Feed Page: Displays a list of posts
class FeedPage extends StatelessWidget {
  // Dummy post data
  final List<Map<String, dynamic>> posts = [
    {
      "id": 1,
      "name": "Helena in Group Name",
      "message": "Post Description",
      "time": "3m ago",
      "image": "https://via.placeholder.com/50",
      "content": "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
    },
    {
      "id": 2,
      "name": "Daniel in Group Name",
      "message":
          "Remember, it's okay to have a bad day. Be kind to yourself...",
      "time": "4m ago",
      "image": "https://via.placeholder.com/50",
      "content": "Daniel’s full post content goes here...",
    },
    {
      "id": 3,
      "name": "James in Group Name",
      "message": "\"Pause, breathe, reset.\"",
      "time": "5m ago",
      "image": "https://via.placeholder.com/50",
      "content": "James’s full post content goes here...",
    },
    {
      "id": 4,
      "name": "Emily in Group Name",
      "message": "\"You are stronger than you know.\"",
      "time": "8m ago",
      "image": "https://via.placeholder.com/50",
      "content": "Emily’s full post content goes here...",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Feed",
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
          onPressed: () {
            // You can pop or do something else here
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Filter logic here
            },
            child: Text(
              "Filter",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post["image"]),
              radius: 25,
            ),
            title: Text(
              post["name"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              post["message"],
              style: TextStyle(color: Colors.grey[700]),
            ),
            trailing: Text(
              post["time"],
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            onTap: () {
              // Navigate to ContentPage and pass the entire post data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContentPage(postData: post),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// Content Page: Shows detailed info for a specific post
class ContentPage extends StatelessWidget {
  final Map<String, dynamic> postData;

  ContentPage({required this.postData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Filter logic for content page (if needed)
            },
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: name & time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  postData["name"],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(postData["time"], style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 10),
            // Profile image
            CircleAvatar(
              backgroundImage: NetworkImage(postData["image"]),
              radius: 30,
            ),
            SizedBox(height: 16),
            // Content
            Text(postData["content"], style: TextStyle(fontSize: 16)),
            // You can add more UI here (like likes/comments, etc.)
          ],
        ),
      ),
    );
  }
}

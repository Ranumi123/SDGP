import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/message_model.dart';
import '../widgets/chat_bubble.dart';
import 'widgets/loading_indicator.dart';
import 'utils/constants.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  bool _isLoading = false;
  bool _isBackendAvailable = true; // Set to true to connect to the backend

  Future<void> _sendMessage(String message) async {
    setState(() {
      _messages.add(Message(
        role: 'user',
        content: message,
        timestamp: DateTime.now(), // Add timestamp
      ));
      _isLoading = true;
    });

    if (_isBackendAvailable) {
      try {
        // Send the message to the backend
        final response = await http.post(
          Uri.parse('http://192.168.1.2:5001/chat'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'message': message}),
        );

        if (response.statusCode == 200) {
          // Parse the response from the backend
          final data = jsonDecode(response.body);
          setState(() {
            _messages.add(Message(
              role: 'bot',
              content: data['reply'], // Use 'reply' as per your backend response
              timestamp: DateTime.now(), // Add timestamp
            ));
            _isLoading = false;
          });
        } else {
          _handleError('Error: Server returned ${response.statusCode}');
        }
      } catch (e) {
        _handleError('Error: Connection failed - $e');
      }
    } else {
      // Mock response if backend is not available
      _handleMockResponse(message);
    }
  }

  void _handleError(String errorMessage) {
    setState(() {
      _messages.add(Message(
        role: 'bot',
        content: errorMessage,
        timestamp: DateTime.now(), // Add timestamp
      ));
      _isLoading = false;
    });
  }

  void _handleMockResponse(String userMessage) {
    String response = "I'm a mock chatbot. Backend is not connected yet.";

    if (userMessage.toLowerCase().contains('hello') ||
        userMessage.toLowerCase().contains('hi')) {
      response = "Hello! I'm a chatbot. How can I assist you today?";
    } else if (userMessage.toLowerCase().contains('how are you')) {
      response = "I'm just a bot, but I'm here to help you!";
    } else if (userMessage.toLowerCase().contains('help')) {
      response = "This is a development version. Please connect to a backend.";
    }

    setState(() {
      _messages.add(Message(
        role: 'bot',
        content: response,
        timestamp: DateTime.now(), // Add timestamp
      ));
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chatbot',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 10,
        shadowColor: Colors.purpleAccent.withOpacity(0.5),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blueAccent.withOpacity(0.1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            if (!_isBackendAvailable)
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.amber[100]!, Colors.blue[100]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.lightBlueAccent),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Development mode: Backend not connected',
                        style: TextStyle(fontSize: 12, color: Colors.blueAccent[800]),
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return ChatBubble(
                    message: message.content,
                    isUser: message.role == 'user',
                    timestamp: message.timestamp, // Pass timestamp
                  );
                },
              ),
            ),
            if (_isLoading) LoadingIndicator(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blueAccent, Colors.white],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.send, color: Colors.white),
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            _sendMessage(_controller.text);
                            _controller.clear();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white, // Start with white
              Colors.lightBlue.shade100, // End with light blue
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // App Logo or Image
              Container(
                height: 200, // Adjusted height for better balance
                child: Image.asset(
                  'assets/img1.png', // Replace with your image path
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              // Welcome Text
              Text(
                'Welcome to MindBridge',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800, // Dark blue for contrast
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              // Description Text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Your journey to mental wellness starts here. Take the first step towards a healthier mind and a happier you.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue.shade600, // Medium blue for readability
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40),
              // Get Started Button
              Container(
                width: double.infinity, // Make the button full width
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.lightBlue.shade300,
                      Colors.blue.shade400,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the login page
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.transparent, // Make button transparent
                    shadowColor: Colors.transparent, // Remove default shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Sign Up Button
              TextButton(
                onPressed: () {
                  // Navigate to the sign-up page
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  'Don\'t have an account? Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
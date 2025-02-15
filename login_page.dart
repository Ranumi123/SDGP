import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // App Logo or Image
              Container(
                height: 180, // Adjust the height as needed
                child: Image.asset(
                  'assets/img1.png', // Replace with your logo image path
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              // Email Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.blue.shade800),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade800),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade800),
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.blue.shade800),
                ),
              ),
              SizedBox(height: 16),
              // Password Field
              TextField(
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.blue.shade800),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade800),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue.shade800),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.blue.shade800),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.blue.shade800,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Login Button
              Container(
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
                    // Handle login logic
                    print('Login button pressed');
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
                    'Log In',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Forgot Password Button
              TextButton(
                onPressed: () {
                  // Navigate to forgot password page
                  print('Forgot password pressed');
                },
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                    color: Colors.blue.shade800,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Or Divider
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade800,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Or',
                      style: TextStyle(
                        color: Colors.blue.shade800,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.blue.shade800,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Continue with Google Button
              OutlinedButton.icon(
                onPressed: () {
                  // Handle Google login
                  print('Continue with Google');
                },
                icon: Icon(Icons.g_mobiledata, color: Colors.green),
                label: Text(
                  'Continue with Google',
                  style: TextStyle(
                    color: Colors.blue.shade800,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  side: BorderSide(color: Colors.blue.shade800),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Continue with Apple Button
              OutlinedButton.icon(
                onPressed: () {
                  // Handle Apple login
                  print('Continue with Apple');
                },
                icon: Icon(Icons.apple, color: Colors.black),
                label: Text(
                  'Continue with Apple',
                  style: TextStyle(
                    color: Colors.blue.shade800,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  side: BorderSide(color: Colors.blue.shade800),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Sign Up Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(
                      color: Colors.blue.shade800,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to the signup page
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
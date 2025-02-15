import 'package:flutter/material.dart';

class PrivacySettingsPage extends StatefulWidget {
  @override
  _PrivacySettingsPageState createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
  bool _dataPrivacyEnabled = true;
  bool _notificationsEnabled = true;
  bool _emailNotificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy & Settings',
          style: TextStyle(
            color: Colors.blue.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.blue.shade800),
      ),
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
          child: ListView(
            children: [
              // Data Privacy Section
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Privacy',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Control how your data is used within the app.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue.shade600,
                        ),
                      ),
                      SizedBox(height: 20),
                      SwitchListTile(
                        title: Text(
                          'Enable Data Privacy',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        subtitle: Text(
                          'Protect your data from being shared with third parties.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue.shade600,
                          ),
                        ),
                        value: _dataPrivacyEnabled,
                        onChanged: (value) {
                          setState(() {
                            _dataPrivacyEnabled = value;
                          });
                        },
                        activeColor: Colors.blue.shade400,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Notification Preferences Section
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notification Preferences',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Customize how you receive notifications.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue.shade600,
                        ),
                      ),
                      SizedBox(height: 20),
                      SwitchListTile(
                        title: Text(
                          'Enable Notifications',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        subtitle: Text(
                          'Receive app notifications.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue.shade600,
                          ),
                        ),
                        value: _notificationsEnabled,
                        onChanged: (value) {
                          setState(() {
                            _notificationsEnabled = value;
                          });
                        },
                        activeColor: Colors.blue.shade400,
                      ),
                      Divider(color: Colors.blue.shade200),
                      SwitchListTile(
                        title: Text(
                          'Email Notifications',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue.shade800,
                          ),
                        ),
                        subtitle: Text(
                          'Receive notifications via email.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue.shade600,
                          ),
                        ),
                        value: _emailNotificationsEnabled,
                        onChanged: (value) {
                          setState(() {
                            _emailNotificationsEnabled = value;
                          });
                        },
                        activeColor: Colors.blue.shade400,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Save Button
              Container(
                width: double.infinity,
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
                    // Save settings logic
                    print('Settings saved');
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
                    'Save Changes',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
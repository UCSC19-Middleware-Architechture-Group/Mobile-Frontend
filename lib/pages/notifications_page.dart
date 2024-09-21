import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'New Service Available',
      'description': 'You have a new service available for activation.',
      'timestamp': '2024-09-20 10:00 AM',
    },
    {
      'title': 'Payment Reminder',
      'description': 'Your payment for the last bill is due soon.',
      'timestamp': '2024-09-19 09:30 AM',
    },
    {
      'title': 'System Maintenance',
      'description': 'Scheduled maintenance will occur on 2024-09-25.',
      'timestamp': '2024-09-18 03:00 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications', // Added title for clarity
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        iconTheme: IconThemeData(color: Colors.white), // Set back arrow color to white
        backgroundColor: Color.fromARGB(255, 16, 35, 68), // Dark blue background
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return _buildNotificationCard(
              title: notification['title']!,
              description: notification['description']!,
              timestamp: notification['timestamp']!,
            );
          },
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required String title,
    required String description,
    required String timestamp,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Color.fromARGB(255, 192, 188, 188), // Light gray background for cards
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            SizedBox(height: 4),
            Text(
              timestamp,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

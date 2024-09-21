import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard', // Added title for clarity
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        backgroundColor: Color.fromARGB(255, 16, 35, 68), // Dark blue background
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overview',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            _buildCard(
              title: 'Profile Management',
              icon: Icons.person,
              description: 'Manage your profile information.',
              onTap: () {
                // Navigate to profile management page
                Navigator.pushNamed(context, '/profile');
              },
            ),
            _buildCard(
              title: 'Services',
              icon: Icons.settings,
              description: 'Activate new services or manage existing ones.',
              onTap: () {
                // Navigate to services page
                Navigator.pushNamed(context, '/services');
              },
            ),
            _buildCard(
              title: 'Recent Bills',
              icon: Icons.receipt,
              description: 'View and pay your recent bills.',
              onTap: () {
                // Navigate to bills page
                Navigator.pushNamed(context, '/bills');
              },
            ),
            _buildCard(
              title: 'Notifications',
              icon: Icons.notifications,
              description: 'Check your notifications and alerts.',
              onTap: () {
                // Navigate to notifications page
                Navigator.pushNamed(context, '/notifications'); // Updated line
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required String description,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 10),
        color: Color.fromARGB(255, 192, 188, 188), // Light gray background for cards
        child: ListTile(
          leading: Icon(icon, size: 40, color: Color.fromARGB(255, 16, 35, 68)),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Text(description),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}

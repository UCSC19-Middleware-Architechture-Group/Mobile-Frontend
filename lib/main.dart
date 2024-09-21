import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart'; // Import your dashboard page


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardPage(),
       
        // Define other routes here
      },
    );
  }
}

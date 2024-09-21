import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart'; // Import your dashboard page
import 'pages/notifications_page.dart'; // Import your notifications page
import 'pages/bill_page.dart';
import 'pages/services_page.dart';
import 'pages/profile_page.dart';

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
        '/notifications': (context) => NotificationsPage(),
        '/bills': (context) => BillsPage(),
        '/services': (context) => ServicesPage(),
        '/profile': (context) => ProfileManagementPage(),
      },
    );
  }
}

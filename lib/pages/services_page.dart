import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  Map<String, dynamic> currentPackage = {
    'name': 'Basic Plan',
    'dataLimit': '10 GB',
    'callLimit': '100 minutes',
    'smsLimit': '50',
  };

  List<Map<String, dynamic>> availablePackages = [
    {
      'name': 'Basic Plan',
      'dataLimit': '10 GB',
      'callLimit': '100 minutes',
      'smsLimit': '50',
    },
    {
      'name': 'Standard Plan',
      'dataLimit': '20 GB',
      'callLimit': '200 minutes',
      'smsLimit': '100',
    },
    {
      'name': 'Premium Plan',
      'dataLimit': '50 GB',
      'callLimit': 'Unlimited',
      'smsLimit': 'Unlimited',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 16, 35, 68),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCurrentPackageSection(),
            SizedBox(height: 20),
            _buildAvailablePackagesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentPackageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current Package',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 5,
          color: Color.fromARGB(255, 192, 188, 188),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${currentPackage['name']}'),
                Text('Data Limit: ${currentPackage['dataLimit']}'),
                Text('Call Limit: ${currentPackage['callLimit']}'),
                Text('SMS Limit: ${currentPackage['smsLimit']}'),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _updateCurrentPackage();
                  },
                  child: Text('Change Package'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 16, 35, 68),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvailablePackagesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Packages',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: availablePackages.length,
          itemBuilder: (context, index) {
            final package = availablePackages[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 5,
              color: Color.fromARGB(255, 192, 188, 188),
              child: ListTile(
                title: Text(package['name']),
                subtitle: Text(
                  'Data: ${package['dataLimit']}, '
                  'Calls: ${package['callLimit']}, '
                  'SMS: ${package['smsLimit']}',
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    _changeServiceActivation(package);
                  },
                  child: Text('Activate'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 16, 35, 68),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void _changeServiceActivation(Map<String, dynamic> package) {
    setState(() {
      currentPackage = package;
    });
    _showMessage('Activated ${package['name']} package');
  }

  void _updateCurrentPackage() {
    _showMessage('Current package updated to ${currentPackage['name']}');
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

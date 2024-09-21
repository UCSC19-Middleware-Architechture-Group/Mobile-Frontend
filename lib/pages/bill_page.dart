import 'package:flutter/material.dart';

class BillsPage extends StatelessWidget {
  final List<Map<String, String>> bills = [
    {
      'amount': '\$150.00',
      'dueDate': '2024-09-15',
      'status': 'Paid',
      'month': 'September',
    },
    {
      'amount': '\$75.00',
      'dueDate': '2024-08-15',
      'status': 'Paid',
      'month': 'August',
    },
    {
      'amount': '\$120.00',
      'dueDate': '2024-07-15',
      'status': 'Paid',
      'month': 'July',
    },
    {
      'amount': '\$200.00',
      'dueDate': '2024-06-15',
      'status': 'Paid',
      'month': 'June',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recent Bills',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 16, 35, 68),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBilledAmountSection(context),
            SizedBox(height: 20),
            _buildPreviousBillsSection(context),
            SizedBox(height: 20),
            _buildCurrentUsageSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBilledAmountSection(BuildContext context) {
    final currentBill = bills[0]; // Assuming the first bill is the current one

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Billed Amount',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 5,
          color: Color.fromARGB(255, 192, 188, 188),
          child: ListTile(
            title: Text(
              currentBill['amount']!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: Text('Due Date: ${currentBill['dueDate']}'),
            trailing: ElevatedButton(
              onPressed: () {
                // Handle payment logic here
                _showMessage(context, 'Payment processed for ${currentBill['amount']}');
              },
              child: Text('Pay Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 16, 35, 68),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPreviousBillsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Previous Bills',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: bills.skip(1).map((bill) => GestureDetector(
              onTap: () {
                _showBillDetails(context, bill);
              },
              child: Container(
                width: 100, // Set a fixed width for each bill card
                margin: EdgeInsets.only(right: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  color: Color.fromARGB(255, 192, 188, 188),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      bill['month']!,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center, // Center text within the card
                    ),
                  ),
                ),
              ),
            )).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentUsageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current Usage',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
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
                Text(
                  'Mobile Data: 5 GB used / 10 GB',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 4),
                Text(
                  'Calls: 50 minutes used / 100 minutes',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 4),
                Text(
                  'SMS: 20 sent / 50',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showBillDetails(BuildContext context, Map<String, String> bill) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('${bill['month']} Bill Details'),
          content: Text(
            'Amount: ${bill['amount']}\n'
            'Due Date: ${bill['dueDate']}\n'
            'Status: ${bill['status']}',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileManagementPage extends StatefulWidget {
  @override
  _ProfileManagementPageState createState() => _ProfileManagementPageState();
}

class _ProfileManagementPageState extends State<ProfileManagementPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Map<String, String> profileData = {
    'name': 'John Doe',
    'email': 'john.doe@example.com',
    'phone': '123-456-7890',
  };

  @override
  void initState() {
    super.initState();
    _nameController.text = profileData['name']!;
    _emailController.text = profileData['email']!;
    _phoneController.text = profileData['phone']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Management',
          style: TextStyle(color: Colors.white), // Make the text white
        ),
        iconTheme: IconThemeData(color: Colors.white), // Make the back arrow white
        backgroundColor: Color.fromARGB(255, 16, 35, 68),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildTextField('Name', _nameController),
            SizedBox(height: 10),
            _buildTextField('Email', _emailController),
            SizedBox(height: 10),
            _buildTextField('Phone', _phoneController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProfile,
              child: Text('Save Changes'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 16, 35, 68),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _saveProfile() {
    setState(() {
      profileData['name'] = _nameController.text;
      profileData['email'] = _emailController.text;
      profileData['phone'] = _phoneController.text;
    });
    _showMessage('Profile updated successfully');
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

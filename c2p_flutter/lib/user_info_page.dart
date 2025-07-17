import 'package:flutter/material.dart';
import 'home_page.dart';


class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final trustedContactController = TextEditingController();
  final addressController = TextEditingController();
  final medicalNoteController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Save data or move to next page
      print("Name: ${nameController.text}");
      print("Contact: ${contactController.text}");
      print("Blood Group: ${bloodGroupController.text}");
      print("Trusted Contact: ${trustedContactController.text}");
      print("Address: ${addressController.text}");
      print("Medical Notes: ${medicalNoteController.text}");

      // TODO: Save to local DB, Firebase, or SharedPreferences
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emergency Info Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildField("Name", nameController),
              _buildField("Contact Number", contactController, keyboardType: TextInputType.phone),
              _buildField("Blood Group", bloodGroupController),
              _buildField("Trusted Contact Number", trustedContactController, keyboardType: TextInputType.phone),
              _buildField("Address", addressController),
              _buildField("Medical Notes", medicalNoteController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Save Info'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: (value) => value == null || value.isEmpty ? 'Please enter $label' : null,
      ),
    );
  }
}

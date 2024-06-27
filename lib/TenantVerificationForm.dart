import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tenant Verification Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: TenantVerificationForm(),
    );
  }
}

class TenantVerificationForm extends StatefulWidget {
  @override
  _TenantVerificationFormState createState() => _TenantVerificationFormState();
}

class _TenantVerificationFormState extends State<TenantVerificationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dobController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _previousAddressController = TextEditingController();
  final _occupationController = TextEditingController();
  final _referencesController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process data.
      String name = _nameController.text;
      String dob = _dobController.text;
      String phone = _phoneController.text;
      String email = _emailController.text;
      String address = _addressController.text;
      String previousAddress = _previousAddressController.text;
      String occupation = _occupationController.text;
      String references = _referencesController.text;

      print("Name: $name");
      print("Date of Birth: $dob");
      print("Phone: $phone");
      print("Email: $email");
      print("Address: $address");
      print("Previous Address: $previousAddress");
      print("Occupation: $occupation");
      print("References: $references");

      // Clear the form
      _nameController.clear();
      _dobController.clear();
      _phoneController.clear();
      _emailController.clear();
      _addressController.clear();
      _previousAddressController.clear();
      _occupationController.clear();
      _referencesController.clear();

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dobController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _previousAddressController.dispose();
    _occupationController.dispose();
    _referencesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/Chandigarh_Police_Logo.png',
              height: 40,
            ),
            Text('Tenant Verification Form',  style: TextStyle(fontWeight: FontWeight.bold,)),

          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildTextField(_nameController, 'Full Name', 'Please enter your full name'),
                SizedBox(height: 16),
                _buildTextField(_dobController, 'Date of Birth', 'Please enter your date of birth'),
                SizedBox(height: 16),
                _buildTextField(_phoneController, 'Phone Number', 'Please enter your phone number', isPhoneNumber: true),
                SizedBox(height: 16),
                _buildTextField(_emailController, 'Email Address', 'Please enter your email address', isEmail: true),
                SizedBox(height: 16),
                _buildTextField(_addressController, 'Current Address', 'Please enter your current address', isMultiLine: true),
                SizedBox(height: 16),
                _buildTextField(_previousAddressController, 'Previous Address', 'Please enter your previous address', isMultiLine: true),
                SizedBox(height: 16),
                _buildTextField(_occupationController, 'Occupation', 'Please enter your occupation'),
                SizedBox(height: 16),
                _buildTextField(_referencesController, 'References', 'Please provide references', isMultiLine: true),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, String validatorText, {bool isMultiLine = false, bool isPhoneNumber = false, bool isEmail = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      maxLines: isMultiLine ? null : 1,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        } else if (isPhoneNumber && !RegExp(r'^\d{10}$').hasMatch(value)) {
          return 'Please enter a valid 10-digit phone number';
        } else if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }
}

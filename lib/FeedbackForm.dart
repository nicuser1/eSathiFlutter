import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feedback Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: FeedbackForm(),
    );
  }
}

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _feedbackController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process data.
      String name = _nameController.text;
      String email = _emailController.text;
      String feedback = _feedbackController.text;

      print("Name: $name");
      print("Email: $email");
      print("Feedback: $feedback");

      // Clear the form
      _nameController.clear();
      _emailController.clear();
      _feedbackController.clear();

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Feedback submitted successfully!')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _feedbackController.dispose();
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
            Text('Feedback Form'),
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
                _buildTextField(_nameController, 'Your Name', 'Please enter your name'),
                SizedBox(height: 16),
                _buildTextField(_emailController, 'Your Email', 'Please enter your email', isEmail: true),
                SizedBox(height: 16),
                _buildFeedbackField(_feedbackController, 'Your Feedback', 'Please enter your feedback'),
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

  Widget _buildTextField(TextEditingController controller, String labelText, String validatorText, {bool isEmail = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        } else if (isEmail && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  Widget _buildFeedbackField(TextEditingController controller, String labelText, String validatorText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      maxLines: 5,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorText;
        }
        return null;
      },
    );
  }
}

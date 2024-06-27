import 'package:chandigarh_police_esaathi/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Saathi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            Text('e-saathi(Police Assistance App)'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/police.png',
                height: 300.0,
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/Chandigarh_Police_Logo.png',
                height: 100.0,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform login action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logging in with ${_phoneController.text}')),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()), // Navigate to the OTP screen
                    );

                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safety Tips',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafetyTipsPage(),
    );
  }
}

class SafetyTipsPage extends StatelessWidget {
  final List<String> safetyTips = [
    'Always be aware of your surroundings.',
    'Do not share personal information with strangers.',
    'Keep your doors and windows locked.',
    'Do not leave valuables in plain sight.',
    'Be cautious when using ATMs, especially at night.',
    'Report any suspicious activity to the police immediately.',
    'Use well-lit, busy streets and avoid shortcuts through alleys.',
    'Trust your instincts. If something feels wrong, it probably is.',
    'Keep emergency numbers handy.',
    'Participate in community watch programs.',
  ];

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
            Text('Safety Tips from Police'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: safetyTips.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Icon(Icons.security),
                title: Text(safetyTips[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}

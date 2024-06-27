import 'package:chandigarh_police_esaathi/CharacterCertificateForm.dart';
import 'package:chandigarh_police_esaathi/EmployeeVerificationForm.dart';
import 'package:chandigarh_police_esaathi/FeedbackForm.dart';
import 'package:chandigarh_police_esaathi/Nearby.dart';
import 'package:chandigarh_police_esaathi/ProblemSuggestionsForm.dart';
import 'package:chandigarh_police_esaathi/SafetyTipsPage.dart';
import 'package:chandigarh_police_esaathi/ServantVerificationForm.dart';
import 'package:chandigarh_police_esaathi/TenantVerificationForm.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'LostArticleFormApp.dart';

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
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CardData {
  final String name;
  final Color color;
  final IconData icon;

  CardData({required this.name, required this.color, required this.icon});
}

class HomePage extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/Chandigarh_Police_Logo.png',
    'assets/images/police.png',
    'assets/images/policehq.png',
    'assets/images/policegroup.png',
  ];

  final List<CardData> cardData = [
    CardData(
        name: 'Lost Article Report',
        color: Colors.red,
        icon: FontAwesomeIcons.search),
    CardData(
        name: 'Safety Tips',
        color: Colors.blue,
        icon: FontAwesomeIcons.shieldAlt),
    CardData(
        name: 'Share Your Problem',
        color: Colors.green,
        icon: FontAwesomeIcons.handHoldingHeart),
    CardData(
        name: 'Feedback & Suggestions',
        color: Colors.orange,
        icon: FontAwesomeIcons.comments),
    CardData(
        name: 'Tenant Verification Request',
        color: Colors.purple,
        icon: FontAwesomeIcons.userCheck),
    CardData(
        name: 'Servant Verification Request',
        color: Colors.teal,
        icon: FontAwesomeIcons.userClock),
    CardData(
        name: 'Character Certificate Request',
        color: Colors.indigo,
        icon: FontAwesomeIcons.portrait),
    CardData(
        name: 'Employee Verification',
        color: Colors.brown,
        icon: FontAwesomeIcons.userTie),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Saathi Home'),
      ),
      body: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
            items: imgList
                .map((item) => Container(
                      child: Center(
                        child:
                            Image.asset(item, fit: BoxFit.cover, width: 1000),
                      ),
                    ))
                .toList(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 3),
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: cardData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (cardData[index].name == 'Lost Article Report') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LostArticleFormApp()),
                        );
                      }
                      ;
                      if (cardData[index].name == 'Feedback & Suggestions') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeedbackForm()),
                        );
                      }
                      ;
                      if (cardData[index].name == 'Share Your Problem') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProblemSuggestionsForm()),
                        );
                      }
                      ;
                      if (cardData[index].name ==
                          'Tenant Verification Request') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TenantVerificationForm()),
                        );
                      }
                      ;
                      if (cardData[index].name ==
                          'Servant Verification Request') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServantVerificationForm()),
                        );
                      }
                      ;
                      if (cardData[index].name ==
                          'Character Certificate Request') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CharacterCertificateForm()),
                        );
                      }
                      ;
                      if (cardData[index].name == 'Employee Verification') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmployeeVerificationForm()),
                        );
                      }
                      ;
                      if (cardData[index].name == 'Safety Tips') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SafetyTipsPage()),
                        );
                      }
                      ;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('${cardData[index].name} clicked')),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.all(8.0),
                      elevation: 5.0,
                      child:      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),

                          width: double.infinity,
                          child: Center(
                              child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    cardData[index].icon,
                                    color: cardData[index].color,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    cardData[index].name,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                          )),


                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

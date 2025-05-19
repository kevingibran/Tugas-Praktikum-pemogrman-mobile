import 'package:flutter/material.dart';
import 'login_page.dart';

class IntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to News Hive', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text('Get the latest news at your fingertips!', textAlign: TextAlign.center),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage())),
                child: Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

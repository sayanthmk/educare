import 'package:flutter/material.dart';

class RetroThird extends StatelessWidget {
  const RetroThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'images/elearning.png',
              height: 300,
              width: 300,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Learn from anywhere',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

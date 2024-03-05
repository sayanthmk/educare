import 'package:flutter/material.dart';

class RetroOne extends StatelessWidget {
  const RetroOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'images/audio-book.png',
              height: 300,
              width: 300,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Achieve your goals',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

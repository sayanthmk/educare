import 'package:flutter/material.dart';

class RetroSecond extends StatelessWidget {
  const RetroSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'images/studying.png',
              height: 300,
              width: 300,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Score the Good marks',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomRaw extends StatelessWidget {
  const CustomRaw({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'List of Items',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          Text(
            'See All',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

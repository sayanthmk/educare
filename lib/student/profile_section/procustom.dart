import 'package:flutter/material.dart';

class ByProSetWidget extends StatelessWidget {
  final Icon iconset;
  final String title;
  final String subtitle;

  const ByProSetWidget({
    super.key,
    required this.iconset,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        width: 350,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  iconset,
                  const SizedBox(
                    width: 10,
                  ),
                  Text(title),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                subtitle,
                style: const TextStyle(
                    fontSize: 18, color: Color.fromRGBO(16, 15, 15, 0.498)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

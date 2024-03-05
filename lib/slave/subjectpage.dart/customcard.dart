import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({
    required this.image,
    required this.onTap,
    required this.subject,
    super.key,
  });
  VoidCallback? onTap;
  Image? image;
  String subject;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: image,
                    ),
                  ),
                  Center(
                    child: Text(
                      subject,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

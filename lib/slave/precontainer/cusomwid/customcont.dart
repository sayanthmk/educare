import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  final Icon iconImagePath;
  final String categoryName;
  VoidCallback ontapset;
  CustomContainer({
    super.key,
    required this.iconImagePath,
    required this.categoryName,
    required this.ontapset,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: InkWell(
        onTap: ontapset,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color.fromARGB(255, 255, 255, 255),
              border: Border.all()),
          child: Row(
            children: [
              Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10)),
                  child: iconImagePath),
              const SizedBox(
                width: 20,
              ),
              Text(categoryName),
            ],
          ),
        ),
      ),
    );
  }
}

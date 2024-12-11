import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSel extends StatelessWidget {
  CustomSel({
    required this.fieldname,
    required this.tapping,
    super.key,
  });
  String fieldname;
  VoidCallback tapping;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapping,
      child: Card(
        elevation: 3,
        child: Container(
          height: 80,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white12),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.book,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  fieldname,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

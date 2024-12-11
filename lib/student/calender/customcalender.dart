import 'package:flutter/material.dart';

class CardCalender extends StatelessWidget {
  const CardCalender({
    super.key,
    required this.eventDescription,
  });

  final dynamic eventDescription;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(10)),
          height: 50,
          child: Center(
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.note,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  eventDescription,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          )),
    );
  }
}

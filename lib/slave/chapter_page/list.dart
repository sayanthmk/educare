import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  CardWidget({
    super.key,
    required this.currentItem,
    required this.ontap,
  });

  final String currentItem;
  VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        color: Colors.deepPurple[200],
        margin: const EdgeInsets.all(10),
        elevation: 3,
        child: ListTile(
          title: Text(currentItem),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [Icon(Icons.arrow_forward)],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DiversionCard extends StatelessWidget {
  DiversionCard({
    required this.fieldtext,
    required this.profilephoto,
    required this.onpressing,
    super.key,
  });
  String profilephoto;
  String fieldtext;
  VoidCallback onpressing;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressing,
      child: Card(
        elevation: 15,
        child: Container(
          height: 200,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  profilephoto,
                ),
                height: 80,
                width: 80,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                fieldtext,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.deepPurple[400]),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

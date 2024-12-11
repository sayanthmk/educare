import 'package:flutter/material.dart';

class DiversionCard extends StatelessWidget {
  const DiversionCard({
    required this.fieldtext,
    required this.profilephoto,
    required this.onpressing,
    super.key,
  });
  final String profilephoto;
  final String fieldtext;
  final VoidCallback onpressing;
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

import 'package:flutter/material.dart';
import 'package:projectedu/starting_page/utilities/colors/colors.dart';

// ignore: must_be_immutable
class SelectField extends StatelessWidget {
  SelectField({
    required this.fieldname,
    required this.tapping,
    this.imagePath = 'picture/box1.png',
    super.key,
  });
  String fieldname;
  VoidCallback tapping;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapping,
      child: Container(
        height: 130,
        width: 350,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(20),
            color: ColorSelect.indigo),
        child: Center(
            child: Text(
          fieldname,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: ColorSelect.white,
          ),
        )),
      ),
    );
  }
}

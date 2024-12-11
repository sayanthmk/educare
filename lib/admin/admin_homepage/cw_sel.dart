import 'package:flutter/material.dart';
import 'package:projectedu/starting_page/utilities/colors/colors.dart';

class SelectField extends StatelessWidget {
  const SelectField({
    required this.fieldname,
    required this.tapping,
    this.imagePath = 'picture/box1.png',
    super.key,
  });
  final String fieldname;
  final VoidCallback tapping;
  final String imagePath;

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

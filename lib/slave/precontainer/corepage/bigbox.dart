import 'package:flutter/material.dart';
import 'package:projectedu/slave/precontainer/cusomwid/docpage.dart';

class BigBoxWidget extends StatelessWidget {
  const BigBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          DoctorPage(
              ontap: () {},
              doctorImagePath: 'images/appdesign.png',
              rating: '4.9',
              doctorName: 'Profile',
              doctorProfession: 'Therapist'),
          DoctorPage(
              ontap: () {},
              doctorImagePath: 'images/appdesign.png',
              rating: '4.9',
              doctorName: 'Calender',
              doctorProfession: 'Therapist'),
          DoctorPage(
              ontap: () {},
              doctorImagePath: 'images/appdesign.png',
              rating: '4.9',
              doctorName: 'Subject',
              doctorProfession: 'Therapist')
        ],
      ),
    );
  }
}

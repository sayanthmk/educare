import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projectedu/slave/calender/usecalender.dart';
import 'package:projectedu/slave/precontainer/cusomwid/customcont.dart';
import 'package:projectedu/slave/subjectpage.dart/sub_page.dart';

class SmallSizedBox extends StatelessWidget {
  const SmallSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CustomContainer(
            ontapset: () {},
            categoryName: 'Profile',
            // iconImagePath: 'images/appdesign.png',
            iconImagePath: const Icon(FontAwesomeIcons.person),
          ),
          CustomContainer(
            ontapset: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const SlaveCalendar(),
                ),
              );
            },
            categoryName: 'Calender',
            // iconImagePath: 'images/appdesign.png',
            iconImagePath: const Icon(FontAwesomeIcons.calendar),
          ),
          CustomContainer(
            ontapset: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const SlaveSubjectPage(),
                ),
              );
            },
            categoryName: 'Subjects',
            // iconImagePath: 'images/appdesign.png',
            iconImagePath: const Icon(FontAwesomeIcons.file),
          ),
          CustomContainer(
            ontapset: () {},
            categoryName: 'Marklist',
            // iconImagePath: 'images/appdesign.png',
            iconImagePath: const Icon(FontAwesomeIcons.chartSimple),
          ),
        ],
      ),
    );
  }
}

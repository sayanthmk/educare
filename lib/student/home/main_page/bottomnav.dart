import 'package:flutter/material.dart';
import 'package:projectedu/student/calender/usecalender.dart';
import 'package:projectedu/student/home/corepage/home_page.dart';
import 'package:projectedu/student/subjectpage.dart/sub_page.dart';
import 'package:projectedu/student/timetable/view/timetable.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

class BottomNavItem extends StatelessWidget {
  BottomNavItem({super.key});
  final pageControlller = PageController();

  void dispose() {
    pageControlller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          controller: pageControlller,
          children: const <Widget>[
            UserFireHomeMain(),
            SlaveCalendar(),
            SlaveSubjectPage(),
            TimetableScreenSetUp()
          ],
        ),
        extendBody: true,
        bottomNavigationBar: RollingBottomBar(
          color: const Color.fromARGB(255, 255, 240, 219),
          controller: pageControlller,
          flat: true,
          useActiveColorByDefault: false,
          items: const [
            RollingBottomBarItem(Icons.home,
                label: 'Home', activeColor: Colors.redAccent),
            RollingBottomBarItem(Icons.calendar_month,
                label: 'Calender', activeColor: Colors.blueAccent),
            RollingBottomBarItem(Icons.calendar_view_day_rounded,
                label: 'Subjects', activeColor: Colors.green),
            RollingBottomBarItem(Icons.lock_clock,
                label: 'TimeTable', activeColor: Colors.orange),
          ],
          enableIconRotation: true,
          onTap: (index) {
            pageControlller.animateToPage(
              index,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOut,
            );
          },
        ),
      ),
    );
  }
}

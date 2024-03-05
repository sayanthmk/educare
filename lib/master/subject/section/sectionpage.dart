import 'package:flutter/material.dart';
import 'package:projectedu/master/subject/add_subject/sub_home.dart';
import 'package:projectedu/master/subject/bioadd/biohome.dart';
import 'package:projectedu/master/subject/cheadd/chehome.dart';
import 'package:projectedu/master/subject/phyadd/phyhome.dart';
import 'package:projectedu/master/subject/section/customsection.dart';

class SectionPage extends StatelessWidget {
  const SectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Padding(
          padding: EdgeInsets.only(left: 60.0),
          child: Text(
            'Subjects',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomSel(
                tapping: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PhysicsSubHomeMaster()));
                },
                fieldname: 'Physics',
              ),
              CustomSel(
                tapping: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChemistrySubHomeMaster()));
                },
                fieldname: 'Chemistry',
              ),
              CustomSel(
                tapping: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BiologySubHomeMaster()));
                },
                fieldname: 'Biology',
              ),
              CustomSel(
                tapping: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SubHomeMaster()));
                },
                fieldname: 'English',
              ),
              CustomSel(
                tapping: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SubHomeMaster()));
                },
                fieldname: 'Mathematics',
              ),
              CustomSel(
                tapping: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SubHomeMaster()));
                },
                fieldname: 'I.T',
              ),
              CustomSel(
                tapping: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SubHomeMaster()));
                },
                fieldname: 'Biology',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

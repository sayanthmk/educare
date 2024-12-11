import 'package:flutter/material.dart';
import 'package:projectedu/student/chapters/biology/biochap.dart';
import 'package:projectedu/student/chapters/chemistry/chemchap.dart';
import 'package:projectedu/student/chapters/physics/phychap.dart';
import 'package:projectedu/student/subjectpage.dart/customcard.dart';
import 'package:projectedu/student/subjectpage.dart/searchbutton.dart';

class SlaveSubjectPage extends StatefulWidget {
  const SlaveSubjectPage({super.key});

  @override
  State<SlaveSubjectPage> createState() => SlaveSubjectPageState();
}

class SlaveSubjectPageState extends State<SlaveSubjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text(
            'SUBJECTS',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          actions: const [
            Padding(
              padding: EdgeInsets.all(15.0),
            )
          ]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 700,
                color: Colors.white,
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40)),
                              color: Colors.deepPurple[400],
                            ),
                            height: 70,
                            width: 400,
                            child: const Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                              ],
                            )),
                        const Positioned(
                          left: 40,
                          top: 40,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [SearchBarSubject()],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: GridView(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1.4,
                          ),
                          children: [
                            CustomCard(
                                image: Image.asset(
                                  'images/chemistry.png',
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const ChemistryPage()));
                                },
                                subject: 'Chemistry'),
                            CustomCard(
                                image: Image.asset('images/atom.png'),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const PhysicsPage()));
                                },
                                subject: 'Physics'),
                            CustomCard(
                                image:
                                    Image.asset('images/personal-computer.png'),
                                onTap: () {},
                                subject: 'I.T'),
                            CustomCard(
                                image: Image.asset('images/microscope.png'),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const BiologyPage()));
                                },
                                subject: 'Biology'),
                            CustomCard(
                                image: Image.asset(
                                  'images/drawing-tools.png',
                                ),
                                onTap: () {},
                                subject: 'Maths'),
                            CustomCard(
                                image: Image.asset(
                                  'images/abc-block.png',
                                ),
                                onTap: () {},
                                subject: 'English'),
                            CustomCard(
                                image: Image.asset(
                                  'images/letter-a.png',
                                ),
                                onTap: () {},
                                subject: 'Hindi'),
                            CustomCard(
                                image: Image.asset(
                                  'images/letter-m.png',
                                ),
                                onTap: () {},
                                subject: 'Malayalam'),
                            CustomCard(
                                image: Image.asset(
                                  'images/scroll.png',
                                ),
                                onTap: () {},
                                subject: 'History'),
                            CustomCard(
                                image: Image.asset(
                                  'images/globe.png',
                                ),
                                onTap: () {},
                                subject: 'Geography'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

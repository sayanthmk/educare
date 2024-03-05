import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projectedu/starting_page/utilities/colors/colors.dart';

class StudentDetails {
  final String name;
  final String mail;
  StudentDetails({
    required this.name,
    required this.mail,
  });
}

class ProfStudent extends StatelessWidget {
  final StudentDetails stdetails;
  const ProfStudent({super.key, required this.stdetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(FontAwesomeIcons.arrowLeft)),
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'PROFILE',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 226, 224, 218),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: ColorSelect.adminamber,
                  backgroundImage: const AssetImage('images/profile2.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: 350,
              height: 70,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 201, 200, 194),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: ListTile(
                  leading: const Icon(FontAwesomeIcons.personHalfDress),
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Name: ${stdetails.name}',
                    ),
                  ),
                  trailing: const Icon(FontAwesomeIcons.arrowRight),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 201, 200, 194),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: ListTile(
                    leading: const Icon(FontAwesomeIcons.circleQuestion),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Name: ${stdetails.mail}',
                      ),
                    ),
                    trailing: const Icon(FontAwesomeIcons.arrowRight),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 201, 200, 194),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.gear),
                    title: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Settings'),
                    ),
                    trailing: Icon(FontAwesomeIcons.arrowRight),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 350,
                height: 70,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 201, 200, 194),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: ListTile(
                    leading: Icon(FontAwesomeIcons.rightFromBracket),
                    title: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Logout'),
                    ),
                    trailing: Icon(FontAwesomeIcons.arrowRight),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

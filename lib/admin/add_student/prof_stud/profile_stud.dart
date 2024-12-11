import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentDetails {
  final String name;
  final String mail;
  final String gender;

  StudentDetails({
    required this.name,
    required this.mail,
    required this.gender,
  });
}

class ProfPage extends StatelessWidget {
  final StudentDetails stdetails;
  const ProfPage({super.key, required this.stdetails});

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
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 10,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: ListTile(
                    leading: const Icon(FontAwesomeIcons.idCard),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Name: ${stdetails.name}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 10,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: ListTile(
                    leading: const Icon(FontAwesomeIcons.wallet),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Mail: ${stdetails.mail}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 10,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: ListTile(
                    leading: const Icon(FontAwesomeIcons.person),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Gender: ${stdetails.gender}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

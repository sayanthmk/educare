import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/student/chapter_page/list.dart';
import 'package:projectedu/student/chemistry/chemnew.dart';
import 'package:projectedu/starting_page/utilities/colors/colors.dart';

class ChemistryPage extends StatefulWidget {
  const ChemistryPage({super.key});

  @override
  State<ChemistryPage> createState() => _ChemistryPageState();
}

class _ChemistryPageState extends State<ChemistryPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: SlaveSubject.slavepurple,
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back)),
          title: const Center(
              child: Text(
            'CHAPTERS',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          actions: const [
            Padding(
              padding: EdgeInsets.all(15.0),
            )
          ]),
      body: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('chemistry').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (_, index) {
                    final currentItem = snapshot.data!.docs[index];
                    return CardWidget(
                      currentItem: currentItem['name'],
                      ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChemistryCore(
                                  id: currentItem.id,
                                )));
                      },
                    );
                  });
            }
          }),
    );
  }
}

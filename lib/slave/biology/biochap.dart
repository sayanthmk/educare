import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/slave/biology/bionew.dart';
import 'package:projectedu/slave/chapter_page/list.dart';
import 'package:projectedu/starting_page/utilities/colors/colors.dart';

class BiologyPage extends StatefulWidget {
  const BiologyPage({super.key});

  @override
  State<BiologyPage> createState() => _BiologyPageState();
}

class _BiologyPageState extends State<BiologyPage> {
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
          stream: FirebaseFirestore.instance.collection('biology').snapshots(),
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
                            builder: (context) => BiologyCore(
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

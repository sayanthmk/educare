import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/slave/chapter_page/list.dart';
import 'package:projectedu/slave/corechapter/corenew.dart';

class ChapterPageNew extends StatefulWidget {
  const ChapterPageNew({super.key});

  @override
  State<ChapterPageNew> createState() => _ChapterPageNewState();
}

class _ChapterPageNewState extends State<ChapterPageNew> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple[100],
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
          stream: FirebaseFirestore.instance.collection('subject').snapshots(),
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
                            builder: (context) => ChapterNew(
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

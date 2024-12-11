import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/student/chapter_page/list.dart';
import 'package:projectedu/student/chapters/physics/phynew.dart';

class PhysicsPage extends StatefulWidget {
  const PhysicsPage({super.key});

  @override
  State<PhysicsPage> createState() => _PhysicsPageState();
}

class _PhysicsPageState extends State<PhysicsPage> {
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
          stream: FirebaseFirestore.instance.collection('physics').snapshots(),
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
                            builder: (context) => PhysicsCore(
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

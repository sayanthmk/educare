import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/admin/subject/phyadd/addphy.dart';
import 'package:projectedu/admin/subject/phyadd/updphy.dart';

class PhysicsSubHomeMaster extends StatefulWidget {
  const PhysicsSubHomeMaster({super.key});

  @override
  State<PhysicsSubHomeMaster> createState() => _PhysicsSubHomeMasterState();
}

class _PhysicsSubHomeMasterState extends State<PhysicsSubHomeMaster> {
  final CollectionReference subjectphysics =
      FirebaseFirestore.instance.collection('physics');
  void deleteDonor(documentId) {
    subjectphysics.doc(documentId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 60.0),
          child: Text(
            "Add Chapters",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddSubPhysics()));
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.green,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: StreamBuilder(
        stream: subjectphysics.orderBy('name').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot subjectSnap = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(255, 231, 223, 223),
                              blurRadius: 10,
                              spreadRadius: 15)
                        ]),
                    child: Column(
                      children: [
                        Text(
                          subjectSnap['name'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          subjectSnap['phone'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            subjectSnap['new'],
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (ctx) {
                                    return PhysicsUpdateSubMaster(
                                      id: subjectSnap.id,
                                    );
                                  }));
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  size: 30,
                                  color: Colors.blue,
                                )),
                            IconButton(
                                onPressed: () {
                                  // deleteDonor(subjectSnap.id);
                                  showDialog(
                                    context: context,
                                    builder: (ctx1) {
                                      return AlertDialog(
                                        title: const Text('Delete'),
                                        content:
                                            const Text('Do you want to delete'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx1).pop();
                                            },
                                            child: const Text('cancel'),
                                          ),
                                          TextButton(
                                              onPressed: () async {
                                                deleteDonor(subjectSnap.id);
                                                Navigator.of(ctx1).pop();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Delete successfully'),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                );
                                              },
                                              child: const Text('ok'))
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

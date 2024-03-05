import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/master/student/st_add/addgmailuser.dart';
import 'package:projectedu/master/student/st_add/updst.dart';

class MasterAssetHome extends StatefulWidget {
  const MasterAssetHome({super.key});

  @override
  State<MasterAssetHome> createState() => _MasterAssetHomeState();
}

class _MasterAssetHomeState extends State<MasterAssetHome> {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('asset');
  void deleteDonor(docId) {
    donor.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Add student",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        actions: const [
          Icon(
            Icons.abc,
            color: Colors.deepPurple,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddUserCenter()));
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.blue,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      body: StreamBuilder(
        stream: donor.orderBy('name').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot donorSnap = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 231, 223, 223),
                                  blurRadius: 10,
                                  spreadRadius: 15)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    donorSnap['name'],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    donorSnap['mail'],
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (ctx) {
                                        return UpdateUserCenter(
                                          id: donorSnap.id,
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
                                      showDialog(
                                        context: context,
                                        builder: (ctx1) {
                                          return AlertDialog(
                                            title: const Text('Delete'),
                                            content: const Text(
                                                'Do you want to delete'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(ctx1).pop();
                                                },
                                                child: const Text('cancel'),
                                              ),
                                              TextButton(
                                                  onPressed: () async {
                                                    deleteDonor(donorSnap.id);
                                                    Navigator.of(ctx1).pop();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                            'Delete successfully'),
                                                        backgroundColor:
                                                            Colors.red,
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
                            )
                          ],
                        )),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

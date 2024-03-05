import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChapterNew extends StatefulWidget {
  final String id;

  const ChapterNew({super.key, required this.id});

  @override
  // ignore: library_private_types_in_public_api
  _ChapterNewState createState() => _ChapterNewState();
}

class _ChapterNewState extends State<ChapterNew> {
  late Stream<List<DocumentSnapshot>> subjectStream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[100],
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 40.0),
            child: Text(
              '',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('subject')
              .doc(widget.id)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(
                    snapshot.data!['name'],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(snapshot.data!['new']),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

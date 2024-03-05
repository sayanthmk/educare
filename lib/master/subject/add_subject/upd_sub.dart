import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/master/subject/add_subject/sub_model.dart';

// ignore: must_be_immutable
class UpdateSubMaster extends StatefulWidget {
  String id;
  UpdateSubMaster({super.key, required this.id});

  @override
  State<UpdateSubMaster> createState() => _UpdateSubMasterState();
}

class _UpdateSubMasterState extends State<UpdateSubMaster> {
  final CollectionReference subject =
      FirebaseFirestore.instance.collection('subject');
  TextEditingController subjectName = TextEditingController();
  TextEditingController subjectPhone = TextEditingController();
  TextEditingController subjectNew = TextEditingController();
  // ignore: unused_field
  final GlobalKey<FormState> _form1Key = GlobalKey<FormState>();

  void updateSubject(docId) {
    final data = {
      'name': subjectName.text,
      'phone': subjectPhone.text,
      'new': subjectNew.text,
    };
    subject.doc(docId).update(data).then((value) => Navigator.pop(context));
  }

  @override
  void initState() {
    subjectName = TextEditingController();
    subjectPhone = TextEditingController();
    subjectNew = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 60.0),
            child: Text(
              "Update Chapter",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('subject')
              .doc(widget.id)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              subjectName.text = snapshot.data!['name'];
              subjectPhone.text = snapshot.data!['phone'];
              subjectNew.text = snapshot.data!['new'];
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: subjectName,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Subject Heading")),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: subjectPhone,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), label: Text("Title")),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        child: TextFormField(
                          controller: subjectNew,
                          maxLines: 10,
                          decoration: const InputDecoration(
                              label: Text("Subject Summary")),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // If the form is valid, update the donor
                          onAddStudentButtonClicked();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Updated successfully'),
                              backgroundColor: Colors.blue,
                            ),
                          );

                          // onAddStudentButtonClicked();
                          // Navigator.pop(context);
                        },
                        style: ButtonStyle(
                            minimumSize: const MaterialStatePropertyAll(
                                Size(double.infinity, 50)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue)),
                        child: const Text(
                          "Update",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ))
                  ],
                ),
              );
            }
          },
        ));
  }

  Future<void> onAddStudentButtonClicked() async {
    final subjectname = subjectName.text.trim();
    final subjectphone = subjectPhone.text.trim();
    final subjectnew = subjectNew.text.trim();
    if (subjectname.isEmpty || subjectphone.isEmpty || subjectnew.isEmpty) {
      return;
    }
    // ignore: unused_local_variable
    final student = SubjectSetModel(
      subjectname: subjectname,
      subjectphone: subjectphone,
      subjectnew: subjectnew,
    );
    await subject.doc(widget.id).update(
        {'name': subjectname, 'phone': subjectphone, 'new': subjectnew});
  }
}

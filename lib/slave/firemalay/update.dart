import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateDonor extends StatefulWidget {
  final String id;
  const UpdateDonor({super.key, required this.id});

  @override
  State<UpdateDonor> createState() => _UpdateDonorState();
}

class _UpdateDonorState extends State<UpdateDonor> {
  final CollectionReference studentUpdate =
      FirebaseFirestore.instance.collection('donor');
  TextEditingController studentName = TextEditingController();
  TextEditingController studentMail = TextEditingController();
  TextEditingController studentgender = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void updateStudent(docId) {
    final data = {
      'name': studentName.text,
      'mail': studentMail.text,
      'gender': studentgender.text,
    };
    studentUpdate
        .doc(docId)
        .update(data)
        .then((value) => Navigator.pop(context));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 45.0),
          child: Text(
            "Update student",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('donor')
              .doc(widget.id)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              studentName.text = snapshot.data!['name'];
              studentMail.text = snapshot.data!['mail'];
              studentgender.text = snapshot.data!['gender'];
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: studentName,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Student name",
                        ),
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
                        controller: studentMail,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Student mail",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid email';
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
                        controller: studentgender,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Student gender",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid gender';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          onAddStudentButtonClicked();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Updated successfully'),
                              backgroundColor: Colors.blue,
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        minimumSize: const WidgetStatePropertyAll(
                            Size(double.infinity, 50)),
                        backgroundColor:
                            WidgetStateProperty.all(Colors.deepPurple),
                      ),
                      child: const Text(
                        "Update",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final name = studentName.text.trim();
    final mail = studentMail.text.trim();
    final gender = studentgender.text.trim();

    // final newStudent = StudentModel(
    //   name: name,
    //   age: mail,
    //   gender: gender,
    // );

    await studentUpdate
        .doc(widget.id)
        .update({'name': name, 'mail': mail, 'gender': gender});
  }
}

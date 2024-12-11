import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/master/student/st_add/authentication.dart';
import 'package:projectedu/master/student/st_add/modelasset.dart';

class UpdateUserCenter extends StatefulWidget {
 final String id;
 const UpdateUserCenter({super.key, required this.id});

  @override
  State<UpdateUserCenter> createState() => _UpdateUserCenterState();
}

class _UpdateUserCenterState extends State<UpdateUserCenter> {
  final CollectionReference studentTri =
      FirebaseFirestore.instance.collection('asset');
  TextEditingController studentName = TextEditingController();
  TextEditingController studentgender = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  String errorMessage = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //  updating donor data
  void updateStudent(docId) {
    final data = {
      'name': studentName.text,
      'mail': controllerEmail.text,
      'gender': studentgender.text,
      'password': controllerPassword.text,
    };
    studentTri.doc(docId).update(data);
  }

  Future<void> updateUserWithEmailAndPassword() async {
    try {
      await AuthenticationPage().createUserWithEmailAndPassword(
        email: controllerEmail.text,
        password: controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message!;
      });
    }
  }

  @override
  void dispose() {
    studentName.dispose();
    controllerEmail.dispose();
    studentgender.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Update Student Page",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('asset')
                .doc(widget.id)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              } else {
                studentName.text = snapshot.data!['name'];
                controllerEmail.text = snapshot.data!['mail'];
                studentgender.text = snapshot.data!['gender'];
                controllerPassword.text = snapshot.data!['password'];
                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
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
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: controllerEmail,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Student mail",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'value is empty';
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: controllerPassword,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "password",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'value is empty';
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
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
                                return 'value is empty';
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              updateUserWithEmailAndPassword();
                              onUpdateStudentButtonClicked();
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
                              Size(double.infinity, 50),
                            ),
                            backgroundColor: WidgetStateProperty.all(
                              Colors.deepPurple,
                            ),
                          ),
                          child: const Text(
                            "UPDATE",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            }));
  }

  Future<void> onUpdateStudentButtonClicked() async {
    // Extracting values from text controllers
    final name = studentName.text.trim();
    final mail = controllerEmail.text.trim();
    final gender = studentgender.text.trim();
    final password = controllerPassword.text.trim();

    // ignore: unused_local_variable
    final newStudent = StudentModel(
      name: name,
      mail: mail,
      gender: gender,
      password: password,
    );

    await studentTri.doc(widget.id).update(
        {'name': name, 'mail': mail, 'gender': gender, 'password': password});
  }
}

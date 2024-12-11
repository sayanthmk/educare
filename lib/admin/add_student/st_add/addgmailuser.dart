import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/admin/student/st_add/authentication.dart';

class AddUserCenter extends StatefulWidget {
  const AddUserCenter({super.key});

  @override
  State<AddUserCenter> createState() => _AddUserCenterState();
}

class _AddUserCenterState extends State<AddUserCenter> {
  final CollectionReference studentTri =
      FirebaseFirestore.instance.collection('asset');
  TextEditingController studentName = TextEditingController();
  TextEditingController studentgender = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  String errorMessage = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void addStudent() {
    final data = {
      'name': studentName.text,
      'mail': controllerEmail.text,
      'gender': studentgender.text,
      'password': controllerPassword.text,
    };
    studentTri.add(data);
  }

  Future<void> createUserWithEmailAndPassword() async {
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
          "Add student Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Form(
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
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    createUserWithEmailAndPassword();
                    addStudent();
                    Navigator.pop(context);
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
                  "ADD",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

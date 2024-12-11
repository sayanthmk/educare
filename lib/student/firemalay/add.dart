import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/student/firemalay/model.dart';

class AddUserCenter extends StatefulWidget {
  const AddUserCenter({super.key});

  @override
  State<AddUserCenter> createState() => AddUserCenterState();
}

class AddUserCenterState extends State<AddUserCenter> {
  final CollectionReference studentdata =
      FirebaseFirestore.instance.collection('donor');
  TextEditingController donorName = TextEditingController();
  TextEditingController donorMail = TextEditingController();
  TextEditingController studentgender = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void addStudent() {
    final data = {
      'name': donorName.text,
      'mail': donorMail.text,
      'gender': studentgender.text,
    };
    studentdata.add(data);
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
                  controller: donorName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Student name"),
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
                  controller: donorMail,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Student mail")),
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
                      label: Text("Student gender")),
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
                      addStudent();
                      Navigator.pop(context);
                    }
                  },
                  style: ButtonStyle(
                      minimumSize: const WidgetStatePropertyAll(
                          Size(double.infinity, 50)),
                      backgroundColor:
                          WidgetStateProperty.all(Colors.deepPurple)),
                  child: const Text(
                    "ADD",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final name = donorName.text.trim();
    final age = donorMail.text.trim();
    final gender = studentgender.text.trim();
    if (name.isEmpty || age.isEmpty || gender.isEmpty) {
      return;
    }
    final student = StudentModel(
      name: name,
      age: age,
      gender: gender,
    );
    studentdata.add(student);
  }
}

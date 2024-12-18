import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/admin/subject/bioadd/biomodel.dart';

class AddSubBiology extends StatefulWidget {
  const AddSubBiology({super.key});

  @override
  State<AddSubBiology> createState() => _AddSubBiologyState();
}

class _AddSubBiologyState extends State<AddSubBiology> {
  final CollectionReference subjectphysics =
      FirebaseFirestore.instance.collection('biology');
  TextEditingController subjectName = TextEditingController();
  TextEditingController subjectPhone = TextEditingController();
  TextEditingController subjectNew = TextEditingController();
  final GlobalKey<FormState> _form1Key = GlobalKey<FormState>();

  void addBiology() {
    final data = {
      'name': subjectName.text,
      'phone': subjectPhone.text,
      'new': subjectNew.text,
    };
    subjectphysics.add(data);
  }

  @override
  void dispose() {
    subjectName.dispose();
    subjectPhone.dispose();
    subjectNew.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 60.0),
          child: Text(
            "Add Chapter",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Form(
        key: _form1Key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
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
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: subjectPhone,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), label: Text("Title")),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: subjectNew,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Subject Summary"),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_form1Key.currentState!.validate()) {
                      addBiology();
                      Navigator.pop(context);
                    }
                  },
                  style: ButtonStyle(
                      minimumSize: const WidgetStatePropertyAll(
                          Size(double.infinity, 50)),
                      backgroundColor: WidgetStateProperty.all(Colors.orange)),
                  child: const Text(
                    "Add Chapter",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final subjectname = subjectName.text.trim();
    final subjectphone = subjectPhone.text.trim();
    final subjectnew = subjectNew.text.trim();
    if (subjectname.isEmpty || subjectphone.isEmpty || subjectnew.isEmpty) {
      return;
    }
    final student = SubjectSetModelBiology(
      subjectname: subjectname,
      subjectphone: subjectphone,
      subjectnew: subjectnew,
    );
    subjectphysics.add(student);
  }
}

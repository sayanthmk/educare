import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectedu/master/subject/add_subject/sub_model.dart';

class AddSubMaster extends StatefulWidget {
  const AddSubMaster({super.key});

  @override
  State<AddSubMaster> createState() => _AddSubMasterState();
}

class _AddSubMasterState extends State<AddSubMaster> {
  final CollectionReference subject =
      FirebaseFirestore.instance.collection('subject');
  TextEditingController subjectName = TextEditingController();
  TextEditingController subjectPhone = TextEditingController();
  TextEditingController subjectNew = TextEditingController();
  final GlobalKey<FormState> _form1Key = GlobalKey<FormState>();

  void addDonor() {
    final data = {
      'name': subjectName.text,
      'phone': subjectPhone.text,
      'new': subjectNew.text,
    };
    subject.add(data);
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
                      addDonor();
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
    final student = SubjectSetModel(
      subjectname: subjectname,
      subjectphone: subjectphone,
      subjectnew: subjectnew,
    );
    subject.add(student);
  }
}

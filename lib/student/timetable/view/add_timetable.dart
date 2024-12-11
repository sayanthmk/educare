import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:projectedu/student/timetable/controller/timetable_functions.dart';
import 'package:projectedu/student/timetable/model/model.dart';

class AddTimetableScreenSetUp extends StatefulWidget {
  const AddTimetableScreenSetUp({Key? key}) : super(key: key);

  @override
  AddTimetableScreenSetUpState createState() => AddTimetableScreenSetUpState();
}

class AddTimetableScreenSetUpState extends State<AddTimetableScreenSetUp> {
  final List<String> subjects = [
    'Physics',
    'Chemistry',
    'Biology',
    'Hindi',
    'Malayalam',
    'English'
  ];
  String selectedSubject = 'Physics';
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();

  final TextEditingController _chapterController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Add Timetable Entry',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  value: selectedSubject,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        selectedSubject = newValue;
                      });
                    }
                  },
                  items: subjects.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  dropdownColor: Colors.deepPurple[100],
                  decoration: const InputDecoration(
                      labelText: "Subject",
                      prefixIcon: Icon(
                        Icons.mail_outline,
                      ),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _chapterController,
                  decoration: const InputDecoration(
                      labelText: 'Chapter', border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Chapter is empty';
                    } else {
                      return null;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 25.0),
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Start Time: $startTime',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: startTime,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (picked != null && picked != startTime) {
                          setState(() {
                            startTime = picked;
                          });
                        }
                      },
                      child: const Text('Pick Start Date'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(startTime),
                        );
                        if (picked != null) {
                          setState(() {
                            startTime = DateTime(
                              startTime.year,
                              startTime.month,
                              startTime.day,
                              picked.hour,
                              picked.minute,
                            );
                          });
                        }
                      },
                      child: const Text('Pick Start Time'),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'End Time: $endTime',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: endTime,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (picked != null && picked != endTime) {
                          setState(() {
                            endTime = picked;
                          });
                        }
                      },
                      child: const Text('Pick End Date'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(endTime),
                        );
                        if (picked != null) {
                          setState(() {
                            endTime = DateTime(
                              endTime.year,
                              endTime.month,
                              endTime.day,
                              picked.hour,
                              picked.minute,
                            );
                          });
                        }
                      },
                      child: const Text('Pick End Time'),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: const ButtonStyle(
                    elevation: WidgetStatePropertyAll(3),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      log('button pressed');
                      onAddStudentButtonClicked();
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('successfully added'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  },
                  child: const Text('Add Timetable Entry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final sub = selectedSubject;
    final startTimevalue = startTime;
    final endTimevalue = endTime;
    final chaptersvalue = _chapterController.text.trim();
    if (sub.isEmpty || chaptersvalue.isEmpty) {
      return;
    }

    final student = TimetableEntry(
      subject: sub,
      chapters: chaptersvalue,
      endTime: startTimevalue,
      startTime: endTimevalue,
    );
    addStudent(student);
  }
}

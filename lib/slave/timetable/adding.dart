import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:projectedu/slave/timetable/functions/ttfunctions.dart';
import 'package:projectedu/slave/timetable/model/model.dart';

class AddTimetableScreenSetUp extends StatefulWidget {
  const AddTimetableScreenSetUp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddTimetableScreenSetUpState createState() =>
      _AddTimetableScreenSetUpState();
}

class _AddTimetableScreenSetUpState extends State<AddTimetableScreenSetUp> {
  final List<String> subjects = [
    'Physics',
    'Chemistry',
    'Biology',
    'Hindi',
    'Malayalam',
    'English'
  ];
  String selectedSubject = 'Physics';
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now();

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
                    'Start Time: $_startTime',
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
                          initialDate: _startTime,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (picked != null && picked != _startTime) {
                          setState(() {
                            _startTime = picked;
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
                          initialTime: TimeOfDay.fromDateTime(_startTime),
                        );
                        if (picked != null) {
                          setState(() {
                            _startTime = DateTime(
                              _startTime.year,
                              _startTime.month,
                              _startTime.day,
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
                      'End Time: $_endTime',
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
                          initialDate: _endTime,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (picked != null && picked != _endTime) {
                          setState(() {
                            _endTime = picked;
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
                          initialTime: TimeOfDay.fromDateTime(_endTime),
                        );
                        if (picked != null) {
                          setState(() {
                            _endTime = DateTime(
                              _endTime.year,
                              _endTime.month,
                              _endTime.day,
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
    final startTimevalue = _startTime;
    final endTimevalue = _endTime;
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

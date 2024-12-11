import 'package:flutter/material.dart';
import 'package:projectedu/slave/timetable/functions/ttfunctions.dart';
import 'package:projectedu/slave/timetable/model/model.dart';

class UpdateTimeNew extends StatefulWidget {
  final TimetableEntry entry;

  const UpdateTimeNew({Key? key, required this.entry}) : super(key: key);

  @override
  UpdateTimeNewState createState() => UpdateTimeNewState();
}

final List<String> subjects = [
  'Physics',
  'Chemistry',
  'Biology',
  'Hindi',
  'Malayalam',
  'English'
];
String selectedSubject = 'Physics';

class UpdateTimeNewState extends State<UpdateTimeNew> {
  late String selectedSubject;
  late DateTime _startTime;
  late DateTime _endTime;
  final TextEditingController _chapterController = TextEditingController();
  final GlobalKey<FormState> _form1Key = GlobalKey<FormState>();
  int? id;
  @override
  void initState() {
    super.initState();
    id = widget.entry.id;
    selectedSubject = widget.entry.subject;
    _startTime = widget.entry.startTime;
    _endTime = widget.entry.endTime;
    _chapterController.text = widget.entry.chapters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Update Timetable Entry',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _form1Key,
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
                  onPressed: () async {
                    onAddStudentButtonClicked(context, widget.entry);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Update successfully'),
                        backgroundColor: Colors.lightBlue,
                      ),
                    );
                  },
                  child: const Text('Update Timetable Entry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonClicked(
      BuildContext context, TimetableEntry existingStudent) async {
    if (_form1Key.currentState!.validate()) {
      final sub = selectedSubject;
      final startTimevalue = _startTime;
      final endTimevalue = _endTime;
      final chaptersvalue = _chapterController.text.trim();
      final newStudent = TimetableEntry(
        id: widget.entry.id,
        subject: sub,
        startTime: startTimevalue,
        endTime: endTimevalue,
        chapters: chaptersvalue,
      );

      editStudent(newStudent);
    }

    Navigator.of(context).pop();
  }
}

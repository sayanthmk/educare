import 'package:flutter/material.dart';
import 'package:projectedu/student/timetable/model/model.dart';

class SetUpPage extends StatefulWidget {
  final TimetableEntry entry;

  const SetUpPage(this.entry, {Key? key}) : super(key: key);

  @override
  State<SetUpPage> createState() => _SetUpPageState();
}

class _SetUpPageState extends State<SetUpPage> {
  @override
  Widget build(BuildContext context) {
    TimetableEntry entry = widget.entry;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Timetable Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Subject: ${entry.subject}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Chapter: ${entry.chapters}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Start Time: ${entry.startTime}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'End Time: ${entry.endTime}',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

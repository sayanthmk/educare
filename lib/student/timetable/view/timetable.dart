import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:projectedu/student/timetable/add_timetable.dart';
import 'package:projectedu/student/timetable/controller/timetable_functions.dart';
import 'package:projectedu/student/timetable/model/model.dart';
import 'package:projectedu/student/timetable/detail_timetable.dart';
import 'package:projectedu/student/timetable/upadate_timetable.dart';

class TimetableScreenSetUp extends StatefulWidget {
  const TimetableScreenSetUp({Key? key}) : super(key: key);

  @override
  State<TimetableScreenSetUp> createState() => TimetableScreenSetUpState();
}

class TimetableScreenSetUpState extends State<TimetableScreenSetUp> {
  @override
  Widget build(BuildContext context) {
    getStudents();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Timetable Chart',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
          valueListenable: studentListNotifier,
          builder: (BuildContext context, List<TimetableEntry> entries,
              Widget? child) {
            if (entries.isEmpty) {
              return const Center(
                child: Text("No timetable entries available."),
              );
            }
            return ListView.builder(
              itemCount: entries.length,
              itemBuilder: (ctx1, index) {
                final entry = entries[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SetUpPage(entry),
                      ),
                    );
                  },
                  child: Slidable(
                    startActionPane: ActionPane(
                      motion: const BehindMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UpdateTimeNew(
                                      entry: entry,
                                    )));
                          },
                          icon: Icons.edit,
                          backgroundColor: Colors.green,
                        ),
                      ],
                    ),
                    endActionPane:
                        ActionPane(motion: const BehindMotion(), children: [
                      SlidableAction(
                        onPressed: (context) {
                          showDialog(
                              context: context,
                              builder: (ctx1) {
                                return AlertDialog(
                                  title: const Text('Delete'),
                                  content: const Text('Do you want to delete'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx1).pop();
                                      },
                                      child: const Text('cancel'),
                                    ),
                                    TextButton(
                                        onPressed: () async {
                                          deleteStudent(entry.id!);
                                          Navigator.of(ctx1).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content:
                                                  Text('Delete successfully'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        },
                                        child: const Text('ok'))
                                  ],
                                );
                              });
                        },
                        icon: Icons.delete,
                        backgroundColor: Colors.red,
                      )
                    ]),
                    child: Card(
                      elevation: 3,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: const Icon(
                            Icons.punch_clock_rounded,
                            color: Colors.white,
                          ),
                          tileColor: Colors.white,
                          title: Text(
                            entry.subject,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            'Start: ${DateFormat('dd-MM-yyyy hh:mm a').format(entry.startTime)}, \nEnd: ${DateFormat('dd-MM-yyyy hh:mm a').format(entry.endTime)}',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTimetableScreenSetUp(),
            ),
          );
        },
        tooltip: 'Add Timetable Entry',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

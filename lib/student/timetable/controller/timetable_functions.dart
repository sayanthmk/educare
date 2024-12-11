import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:projectedu/student/timetable/model/model.dart';

ValueNotifier<List<TimetableEntry>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(TimetableEntry data) async {
  final db = await Hive.openBox<TimetableEntry>('timetableBox');
  data.id = await db.add(data);
  db.put(data.id, data);
  await getStudents();
}

Future<void> editStudent(TimetableEntry data) async {
  final db = await Hive.openBox<TimetableEntry>('timetableBox');
  db.put(data.id, data);
  await getStudents();
}

Future<void> deleteStudent(int id) async {
  final db = await Hive.openBox<TimetableEntry>('timetableBox');
  await db.delete(id);
  await getStudents();
}

Future<List<TimetableEntry>> getAllData() async {
  final db = await Hive.openBox<TimetableEntry>('timetableBox');
  return db.values.toList();
}

Future<void> getStudents() async {
  studentListNotifier.value.clear();
  final allStudents = await getAllData();
  Future.forEach(allStudents, (element) {
    studentListNotifier.value.add(element);
  });
  studentListNotifier.notifyListeners();
}

import 'package:hive_flutter/hive_flutter.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class TimetableEntry {
  @HiveField(0)
  final String subject;

  @HiveField(1)
  final DateTime startTime;

  @HiveField(2)
  final DateTime endTime;

  @HiveField(3)
  final String chapters;

  @HiveField(4)
  int? id;

  TimetableEntry(
      {required this.subject,
      required this.startTime,
      required this.endTime,
      required this.chapters,
      this.id});
}

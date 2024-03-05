// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimetableEntryAdapter extends TypeAdapter<TimetableEntry> {
  @override
  final int typeId = 1;

  @override
  TimetableEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimetableEntry(
      subject: fields[0] as String,
      startTime: fields[1] as DateTime,
      endTime: fields[2] as DateTime,
      chapters: fields[3] as String,
      id: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TimetableEntry obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.subject)
      ..writeByte(1)
      ..write(obj.startTime)
      ..writeByte(2)
      ..write(obj.endTime)
      ..writeByte(3)
      ..write(obj.chapters)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimetableEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypeTaskAdapter extends TypeAdapter<TypeTask> {
  @override
  final int typeId = 3;

  @override
  TypeTask read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TypeTask.sowing;
      case 1:
        return TypeTask.tillage;
      case 2:
        return TypeTask.protection;
      default:
        return TypeTask.sowing;
    }
  }

  @override
  void write(BinaryWriter writer, TypeTask obj) {
    switch (obj) {
      case TypeTask.sowing:
        writer.writeByte(0);
        break;
      case TypeTask.tillage:
        writer.writeByte(1);
        break;
      case TypeTask.protection:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

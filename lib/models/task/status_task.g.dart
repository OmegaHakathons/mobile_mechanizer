// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusTaskAdapter extends TypeAdapter<StatusTask> {
  @override
  final int typeId = 5;

  @override
  StatusTask read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return StatusTask.neww;
      case 1:
        return StatusTask.to;
      case 2:
        return StatusTask.filled;
      case 3:
        return StatusTask.road;
      case 4:
        return StatusTask.process;
      case 5:
        return StatusTask.pause;
      case 6:
        return StatusTask.problem;
      case 7:
        return StatusTask.done;
      case 8:
        return StatusTask.finish;
      default:
        return StatusTask.neww;
    }
  }

  @override
  void write(BinaryWriter writer, StatusTask obj) {
    switch (obj) {
      case StatusTask.neww:
        writer.writeByte(0);
        break;
      case StatusTask.to:
        writer.writeByte(1);
        break;
      case StatusTask.filled:
        writer.writeByte(2);
        break;
      case StatusTask.road:
        writer.writeByte(3);
        break;
      case StatusTask.process:
        writer.writeByte(4);
        break;
      case StatusTask.pause:
        writer.writeByte(5);
        break;
      case StatusTask.problem:
        writer.writeByte(6);
        break;
      case StatusTask.done:
        writer.writeByte(7);
        break;
      case StatusTask.finish:
        writer.writeByte(8);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

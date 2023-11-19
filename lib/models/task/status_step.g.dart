// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_step.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatusStepAdapter extends TypeAdapter<StatusStep> {
  @override
  final int typeId = 4;

  @override
  StatusStep read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return StatusStep.complete;
      case 1:
        return StatusStep.inprogress;
      case 2:
        return StatusStep.upcoming;
      case 3:
        return StatusStep.fail;
      default:
        return StatusStep.complete;
    }
  }

  @override
  void write(BinaryWriter writer, StatusStep obj) {
    switch (obj) {
      case StatusStep.complete:
        writer.writeByte(0);
        break;
      case StatusStep.inprogress:
        writer.writeByte(1);
        break;
      case StatusStep.upcoming:
        writer.writeByte(2);
        break;
      case StatusStep.fail:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusStepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

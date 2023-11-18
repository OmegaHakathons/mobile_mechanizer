// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_custom.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StepCustomAdapter extends TypeAdapter<_$StepCustomImpl> {
  @override
  final int typeId = 23;

  @override
  _$StepCustomImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$StepCustomImpl(
      index: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      status: fields[3] as StatusStep,
      comment: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$StepCustomImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.comment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StepCustomAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StepCustomImpl _$$StepCustomImplFromJson(Map<String, dynamic> json) =>
    _$StepCustomImpl(
      index: json['index'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      status: $enumDecode(_$StatusStepEnumMap, json['status']),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$$StepCustomImplToJson(_$StepCustomImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'description': instance.description,
      'status': _$StatusStepEnumMap[instance.status]!,
      'comment': instance.comment,
    };

const _$StatusStepEnumMap = {
  StatusStep.complete: 'complete',
  StatusStep.inprogress: 'inprogress',
  StatusStep.upcoming: 'upcoming',
  StatusStep.fail: 'fail',
};

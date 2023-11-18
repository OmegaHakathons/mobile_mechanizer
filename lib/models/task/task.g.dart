// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<_$TaskImpl> {
  @override
  final int typeId = 21;

  @override
  _$TaskImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$TaskImpl(
      id: fields[0] as int,
      type: fields[1] as TypeTask,
      shortDescription: fields[2] as String,
      steps: (fields[3] as List).cast<StepCustom>(),
      currentStep: fields[4] as int?,
      car: fields[5] as Car,
      aggregate: fields[6] as Aggregate,
      field: fields[7] as String,
      minSpeed: fields[8] as int,
      maxSpeed: fields[9] as int,
      depth: fields[10] as int?,
      material: fields[11] as String?,
      consumption: fields[12] as int?,
      deadline: fields[13] as DateTime,
      status: fields[14] as StatusTask,
      executor: fields[15] as String,
      money: fields[16] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, _$TaskImpl obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.shortDescription)
      ..writeByte(4)
      ..write(obj.currentStep)
      ..writeByte(5)
      ..write(obj.car)
      ..writeByte(6)
      ..write(obj.aggregate)
      ..writeByte(7)
      ..write(obj.field)
      ..writeByte(8)
      ..write(obj.minSpeed)
      ..writeByte(9)
      ..write(obj.maxSpeed)
      ..writeByte(10)
      ..write(obj.depth)
      ..writeByte(11)
      ..write(obj.material)
      ..writeByte(12)
      ..write(obj.consumption)
      ..writeByte(13)
      ..write(obj.deadline)
      ..writeByte(14)
      ..write(obj.status)
      ..writeByte(15)
      ..write(obj.executor)
      ..writeByte(16)
      ..write(obj.money)
      ..writeByte(3)
      ..write(obj.steps);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as int,
      type: $enumDecode(_$TypeTaskEnumMap, json['type']),
      shortDescription: json['shortDescription'] as String,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => StepCustom.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentStep: json['currentStep'] as int?,
      car: Car.fromJson(json['car'] as Map<String, dynamic>),
      aggregate: Aggregate.fromJson(json['aggregate'] as Map<String, dynamic>),
      field: json['field'] as String,
      minSpeed: json['minSpeed'] as int,
      maxSpeed: json['maxSpeed'] as int,
      depth: json['depth'] as int?,
      material: json['material'] as String?,
      consumption: json['consumption'] as int?,
      deadline: DateTime.parse(json['deadline'] as String),
      status: $enumDecode(_$StatusTaskEnumMap, json['status']),
      executor: json['executor'] as String,
      money: json['money'] as int?,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$TypeTaskEnumMap[instance.type]!,
      'shortDescription': instance.shortDescription,
      'steps': instance.steps,
      'currentStep': instance.currentStep,
      'car': instance.car,
      'aggregate': instance.aggregate,
      'field': instance.field,
      'minSpeed': instance.minSpeed,
      'maxSpeed': instance.maxSpeed,
      'depth': instance.depth,
      'material': instance.material,
      'consumption': instance.consumption,
      'deadline': instance.deadline.toIso8601String(),
      'status': _$StatusTaskEnumMap[instance.status]!,
      'executor': instance.executor,
      'money': instance.money,
    };

const _$TypeTaskEnumMap = {
  TypeTask.sowing: 'sowing',
  TypeTask.tillage: 'tillage',
  TypeTask.protection: 'protection',
};

const _$StatusTaskEnumMap = {
  StatusTask.neww: 'neww',
  StatusTask.to: 'to',
  StatusTask.filled: 'filled',
  StatusTask.road: 'road',
  StatusTask.process: 'process',
  StatusTask.pause: 'pause',
  StatusTask.problem: 'problem',
  StatusTask.done: 'done',
  StatusTask.finish: 'finish',
};

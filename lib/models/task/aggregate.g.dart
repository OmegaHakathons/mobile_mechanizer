// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aggregate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AggregateAdapter extends TypeAdapter<_$AggregateImpl> {
  @override
  final int typeId = 24;

  @override
  _$AggregateImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$AggregateImpl(
      id: fields[0] as int,
      name: fields[1] as String,
      number: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$AggregateImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AggregateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AggregateImpl _$$AggregateImplFromJson(Map<String, dynamic> json) =>
    _$AggregateImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      number: json['number'] as String,
    );

Map<String, dynamic> _$$AggregateImplToJson(_$AggregateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
    };

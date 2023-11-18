// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarAdapter extends TypeAdapter<_$CarImpl> {
  @override
  final int typeId = 22;

  @override
  _$CarImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$CarImpl(
      id: fields[0] as int,
      name: fields[1] as String,
      number: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$CarImpl obj) {
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
      other is CarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarImpl _$$CarImplFromJson(Map<String, dynamic> json) => _$CarImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      number: json['number'] as String,
    );

Map<String, dynamic> _$$CarImplToJson(_$CarImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'number': instance.number,
    };

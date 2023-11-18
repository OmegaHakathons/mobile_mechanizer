import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'car.freezed.dart';
part 'car.g.dart';

@Freezed()
class Car with _$Car {
  @HiveType(typeId: 22, adapterName: 'CarAdapter')
  const factory Car({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'name') @HiveField(1) required String name,
    @JsonKey(name: 'number') @HiveField(2) required String number,
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
}

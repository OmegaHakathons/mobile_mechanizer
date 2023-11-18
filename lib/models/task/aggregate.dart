import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'aggregate.freezed.dart';
part 'aggregate.g.dart';

@Freezed()
class Aggregate with _$Aggregate {
  @HiveType(typeId: 24, adapterName: 'CarAdapter')
  const factory Aggregate({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'name') @HiveField(1) required String name,
    @JsonKey(name: 'number') @HiveField(2) required String number,
  }) = _Aggregate;

  factory Aggregate.fromJson(Map<String, dynamic> json) => _$AggregateFromJson(json);
}

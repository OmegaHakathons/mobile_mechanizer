import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'aggregate.dart';
import 'car.dart';
import 'status_task.dart';

import 'step_custom.dart';
import 'type_task.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@Freezed()
class Task with _$Task {
  @HiveType(typeId: 21, adapterName: 'TaskAdapter')
  const factory Task({
    @JsonKey(name: 'id') @HiveField(0) required int id,
    @JsonKey(name: 'type') @HiveField(1) required TypeTask type,
    @JsonKey(name: 'shortDescription') @HiveField(2) required String shortDescription,
    @JsonKey(name: 'steps') @HiveField(3) required List<StepCustom> steps,
    @JsonKey(name: 'currentStep') @HiveField(4) int? currentStep,
    @JsonKey(name: 'car') @HiveField(5) Car? car,
    @JsonKey(name: 'aggregate') @HiveField(6) Aggregate? aggregate,
    @JsonKey(name: 'field') @HiveField(7) required String field, // пока просто, в будущем класс с местоположением
    @JsonKey(name: 'minSpeed') @HiveField(8) required int minSpeed,
    @JsonKey(name: 'maxSpeed') @HiveField(9) required int maxSpeed,
    @JsonKey(name: 'depth') @HiveField(10) int? depth,
    @JsonKey(name: 'material') @HiveField(11) String? material,
    @JsonKey(name: 'consumption') @HiveField(12) int? consumption,
    @JsonKey(name: 'deadline') @HiveField(13) required DateTime deadline,
    @JsonKey(name: 'status') @HiveField(14) required StatusTask status,
    @JsonKey(name: 'executor') @HiveField(15) String? executor, // ПЕРЕДЕЛАТЬ НА КЛАСС !!!!!!!!!!!!!!!!!!!!
    @JsonKey(name: 'money') @HiveField(16) int? money,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

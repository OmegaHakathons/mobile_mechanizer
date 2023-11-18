import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'status_step.dart';

part 'step_custom.freezed.dart';
part 'step_custom.g.dart';

@Freezed()
class StepCustom with _$StepCustom {
  @HiveType(typeId: 23, adapterName: 'StepCustomAdapter')
  const factory StepCustom({
    @JsonKey(name: 'index') @HiveField(0) required int index,
    @JsonKey(name: 'name') @HiveField(1) required String name,
    @JsonKey(name: 'description') @HiveField(2) required String description,
    @JsonKey(name: 'status') @HiveField(3) required StatusStep status,
    @JsonKey(name: 'comment') @HiveField(4) String? comment,
  }) = _StepCustom;

  factory StepCustom.fromJson(Map<String, dynamic> json) => _$StepCustomFromJson(json);
}

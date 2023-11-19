import 'package:hive_flutter/hive_flutter.dart';

part 'status_step.g.dart';
@HiveType(typeId: 4, adapterName: 'StatusStepAdapter')
enum StatusStep { 
  @HiveField(0)
  complete, 
  @HiveField(1)
  inprogress, 
  @HiveField(2)
  upcoming, 
  @HiveField(3)
  fail 
}

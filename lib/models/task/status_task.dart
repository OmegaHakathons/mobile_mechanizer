import 'package:hive_flutter/hive_flutter.dart';

part 'status_task.g.dart';
@HiveType(typeId: 5, adapterName: 'StatusTaskAdapter')
enum StatusTask {
  @HiveField(0)
  neww,
  @HiveField(1)
  to,
  @HiveField(2)
  filled,
  @HiveField(3)
  road,
  @HiveField(4)
  process,
  @HiveField(5)
  pause,
  @HiveField(6)
  problem,
  @HiveField(7)
  done,
  @HiveField(8)
  finish
}


// статусы задачи
// new
// to
// filled
// road
// process
// pause
// problem
// done
// finish
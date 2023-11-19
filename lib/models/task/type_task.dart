import 'package:hive_flutter/hive_flutter.dart';

part 'type_task.g.dart';

@HiveType(typeId: 3, adapterName: 'TypeTaskAdapter')
enum TypeTask implements Comparable<TypeTask> {
  @HiveField(0)
  sowing(name: 'Посев'),
  @HiveField(1)
  tillage(name: 'Обработка почвы'),
  @HiveField(2)
  protection(name: 'Защита растений');

  const TypeTask({
    required this.name,
  });

  final String name;

  @override
  int compareTo(TypeTask other) => index - other.index;
}

// посев, обработка почвы, защита
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../models/task/aggregate.dart';
import '../../models/task/car.dart';
import '../../models/task/status_step.dart';
import '../../models/task/status_task.dart';
import '../../models/task/step_custom.dart';
import '../../models/task/task.dart';
import '../../models/task/type_task.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Task> historyTasks = [
    Task(
      id: 5,
      type: TypeTask.sowing,
      shortDescription:
          'Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих чертах.',
      steps: [
        StepCustom(
          index: 0,
          name: 'Осмотр Техники',
          description:
              'Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих.',
          status: StatusStep.complete,
        ),
        StepCustom(
          index: 1,
          name: 'Пополнил запас топливо',
          description:
              'Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих.',
          status: StatusStep.complete,
        ),
        StepCustom(
          index: 2,
          name: 'Дорога до поля',
          description: 'Описание задачи в общих чертах.',
          status: StatusStep.inprogress,
        ),
        StepCustom(
          index: 3,
          name: 'Посев',
          description:
              'Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих.',
          status: StatusStep.upcoming,
        ),
      ],
      currentStep: 1,
      car: Car(id: 4, name: 'Машина', number: 'У123АМ777'),
      aggregate: Aggregate(id: 9, name: 'Агрегат', number: '6'),
      field: 'П-51 ',
      minSpeed: 8,
      maxSpeed: 12,
      deadline: DateTime(2023, 11, 16),
      status: StatusTask.process,
      executor: 'Иван Иванович',
      money: 1234,
    ),
    Task(
      id: 3,
      type: TypeTask.sowing,
      shortDescription:
          'Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих чертах.',
      steps: [
        StepCustom(
          index: 0,
          name: 'Осмотр Техники',
          description:
              'Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих.',
          status: StatusStep.complete,
        ),
        StepCustom(
          index: 1,
          name: 'Пополнил запас топливо',
          description:
              'Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих.',
          status: StatusStep.complete,
        ),
        StepCustom(
          index: 2,
          name: 'Дорога до поля',
          description: 'Описание задачи в общих чертах.',
          status: StatusStep.inprogress,
        ),
        StepCustom(
          index: 3,
          name: 'Посев',
          description:
              'Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих чертах. Описание задачи в общих.',
          status: StatusStep.upcoming,
        ),
      ],
      currentStep: 1,
      car: Car(id: 4, name: 'Машина', number: 'У123АМ777'),
      aggregate: Aggregate(id: 9, name: 'Агрегат', number: '6'),
      field: 'П-51 ',
      minSpeed: 8,
      maxSpeed: 12,
      deadline: DateTime(2023, 11, 10),
      status: StatusTask.process,
      executor: 'Иван Иванович',
      money: 935,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Поиск'),
            ),
            TotalMoney(),
            Expanded(
              child: GroupedListView<Task, DateTime>(
                padding: EdgeInsets.only(bottom: 12),
                groupBy: (Task element) {
                  return DateTime(element.deadline.year, element.deadline.month,
                      element.deadline.day);
                },
                elements: historyTasks,
                order: GroupedListOrder.DESC,
                groupHeaderBuilder: (element) => Padding(
                  padding: const EdgeInsets.only(bottom: 12, top: 24),
                  child: Text(
                    DateFormat('dd MMMM, EEEE', 'ru').format(element.deadline),
                    // style: context.read<AppStateManager>().darkMode
                    //     ? Theme.of(context).textTheme.bodyMedium
                    //     : Theme.of(context).textTheme.headlineLarge!.copyWith(
                    //         color: element.dateTime.isSameDate(DateTime.now())
                    //             ? Theme.of(context).colorScheme.primary
                    //             : Color(0xFF7A7A7A)),
                  ),
                ),
                itemBuilder: (context, element) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey.shade300),
                    margin: const EdgeInsets.only(right: 12),
                    child:
                        Text('${element.type.name} (+${element.money} руб)')),
                separator: const SizedBox(height: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TotalMoney extends StatelessWidget {
  const TotalMoney({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 72),
      child: Column(
        children: [
          Text(
            '13 654 руб',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text('заработано с начала месяца'),
        ],
      ),
    );
  }
}

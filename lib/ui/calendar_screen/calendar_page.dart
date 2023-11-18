import 'package:agro_mech/models/task/task.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../common/navigation/route_name.dart';
import '../work_screen/work_page.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AboutUser(),
            const SizedBox(height: 12),
            Calendar(),
            const SizedBox(height: 12),
            DayTaks(),
          ],
        ),
      ),
    );
  }
}

class DayTaks extends StatelessWidget {
  const DayTaks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Задачи на сегодня'),
        const SizedBox(height: 12),
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => TaskCard(task: task),
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: 3)
      ]),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(RouteName.previewTask, extra: task);
      },
      child: Ink(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.purple.shade200,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.type.name),
              const SizedBox(height: 12),
              Text('Поле: ${task.field}'),
              Text('Техника: ${task.car.name}'),
              Text('Приоритет: ДОБАВИТЬ'),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey),
                child: Text(task.status.name),
              )),
        ]),
      ),
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(DateFormat('dd MMMM', 'ru').format(DateTime.now())),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 106,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 24),
                ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(6)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(DateFormat('E, d', 'ru')
                                  .format(DateTime.now())),
                              Text('2'),
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 20),
                    itemCount: 4),
                const SizedBox(width: 24),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class AboutUser extends StatelessWidget {
  const AboutUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Привет!'),
              SizedBox(height: 4),
              Text('Петр Сергеев Петрович'),
            ],
          )
        ],
      ),
    );
  }
}

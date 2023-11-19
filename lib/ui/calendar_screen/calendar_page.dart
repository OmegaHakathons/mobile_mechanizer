import 'package:agro_mech/cubits/calendar_cubit.dart';
import 'package:agro_mech/cubits/task_cubit.dart';
import 'package:agro_mech/models/task/status_task.dart';
import 'package:agro_mech/models/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../common/navigation/route_name.dart';
import '../../common/utils.dart';
import '../../data/mok.dart';
import '../../models/state/calendar_state.dart';

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
        child: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, state) {
            // не делать константой !!! (позже исправлю)
            return Column(
              children: [
                AboutUser(),
                SizedBox(height: 12),
                Calendar(),
                SizedBox(height: 12),
                DayTaks(),
              ],
            );
          },
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
    final selectedDate = context.read<CalendarCubit>().state.selectedDate;
    final List<Task> tasks = context
        .read<TaskCubit>()
        .state
        .tasks
        .where((t) => getYearMonthDay(t.deadline) == selectedDate)
        .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Задачи на ${getDateName(selectedDate).toLowerCase()}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => TaskCard(task: tasks[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: tasks.length)
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.type.name),
              const SizedBox(height: 12),
              Text('Поле: ${task.field}'),
              Text('Техника: ${task.car?.name}'),
              Text('Приоритет: ДОБАВИТЬ'),
            ],
          ),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: getStatusColor(task.status)),
                child: Text(getTaskStatus(task.status)),
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
    final List<DateTime> dates = context
        .read<TaskCubit>()
        .state
        .tasks
        .map((e) => getYearMonthDay(e.deadline))
        .toSet()
        .toList()
        .where((element) =>
            !getYearMonthDay(element).isBefore(getYearMonthDay(DateTime.now())))
        .toList();
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              DateFormat('dd MMMM', 'ru').format(DateTime.now()),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 84,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 24),
                  ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final tastCount = context
                            .read<TaskCubit>()
                            .state
                            .tasks
                            .where((t) =>
                                getYearMonthDay(t.deadline) == dates[index] &&
                                t.status != StatusTask.finish)
                            .length;

                        final isSelected = dates[index] ==
                            context.read<CalendarCubit>().state.selectedDate;

                        return InkWell(
                          onTap: () {
                            context
                                .read<CalendarCubit>()
                                .updateDate(dates[index]);
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.grey
                                    : Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(6)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(DateFormat('E, d', 'ru')
                                    .format(dates[index])),
                                Text(tastCount.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 20),
                      itemCount: dates.length),
                  const SizedBox(width: 24),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AboutUser extends StatelessWidget {
  const AboutUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.grey,
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../common/utils.dart';
import '../../cubits/task_cubit.dart';
import '../../data/mok.dart';
import '../../models/task/status_task.dart';
import '../../models/task/task.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: 'Поиск'),
            ),
            const TotalMoney(),
            Expanded(
              child: GroupedListView<Task, DateTime>(
                padding: const EdgeInsets.only(bottom: 12),
                groupBy: (Task element) {
                  return DateTime(element.deadline.year, element.deadline.month,
                      element.deadline.day);
                },
                elements: context
                    .read<TaskCubit>()
                    .state
                    .tasks
                    .where((e) =>
                        !getYearMonthDay(e.deadline)
                            .isAfter(getYearMonthDay(DateTime.now())) &&
                        e.status == StatusTask.finish)
                    .toList(),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
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
      padding: const EdgeInsets.symmetric(vertical: 72),
      child: Column(
        children: [
          Text(
            '13 654 руб',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Text('заработано с начала месяца'),
        ],
      ),
    );
  }
}

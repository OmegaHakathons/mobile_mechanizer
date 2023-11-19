import 'package:agro_mech/models/app_tabs.dart';
import 'package:agro_mech/models/task/status_task.dart';
import 'package:agro_mech/models/work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../common/navigation/route_name.dart';
import '../../../cubits/app_cubit.dart';
import '../../../cubits/task_cubit.dart';
import '../../../models/task/task.dart';
import 'custom_stepper.dart';

// https://www.figma.com/file/dlOFTpqa0UdhqnVFrr4lXo/AgroCode-Hack-2023?type=design&node-id=3-118&mode=design&t=Lix5SUju198xPIEH-0
class BeginWork extends StatelessWidget {
  const BeginWork({
    super.key,
    required this.task,
  });

  final Task? task;

  @override
  Widget build(BuildContext context) {
    Task? curTask = context.read<TaskCubit>().state.task;
    return SafeArea(
      child: task == null
          ? Center(
              child: Text('На сегодня задач нет'),
            )
          : Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: curTask?.id == task?.id ? 60 : 16,
                      top: 16),
                  // color: Colors.pink.withOpacity(0.2),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task!.type.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        MainInfoTask(task: task!),
                        const SizedBox(height: 20),
                        CustomStepper(
                          steps: task!.steps,
                          seperatorColor: const Color(0xffD2D5DF),
                          isExpandable: true,
                          showStepStatusWidget: true,
                          backgroundColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
                if (curTask?.id == task?.id)
                  Positioned(
                      bottom: 10,
                      right: 12,
                      left: 12,
                      child: ElevatedButton(
                          onPressed: () {
                            if (curTask.status == StatusTask.neww) {
                              context
                                  .read<TaskCubit>()
                                  .updateCurrentStepIndex();
                            }
                            context.read<AppCubit>().updateWork(Work.process);
                            context.read<AppCubit>().updateTab(AppTabs.work);
                            if (context.canPop()) {
                              context.goNamed(RouteName.base);
                            }
                          },
                          child: Text(curTask!.status == StatusTask.neww
                              ? 'Приступить к работе'
                              : 'Продоолжить выполнение')))
              ],
            ),
    );
  }
}

class MainInfoTask extends StatelessWidget {
  const MainInfoTask({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Поле: ${task.field}'),
        Text('Техника: ${task.car.name}'),
        Text('Агрегат: ${task.aggregate.name}'),
        Text(
            'Дата выполнения: ${DateFormat('dd MMMM, EEEE', 'ru').format(task.deadline)}'),
      ],
    );
  }
}

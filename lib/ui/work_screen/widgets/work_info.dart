import 'dart:developer';

import 'package:agro_mech/cubits/app_cubit.dart';
import 'package:agro_mech/models/app_tabs.dart';
import 'package:agro_mech/models/state/app_state.dart';
import 'package:agro_mech/models/task/status_step.dart';
import 'package:agro_mech/models/task/status_task.dart';
import 'package:agro_mech/models/work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/task_cubit.dart';
import '../../../models/state/tasks_state.dart';
import '../../../models/task/task.dart';

// ТЕКУЩАЯ ЗАДАЧА https://www.figma.com/file/dlOFTpqa0UdhqnVFrr4lXo/AgroCode-Hack-2023?type=design&node-id=3-118&mode=design&t=Lix5SUju198xPIEH-0
class WorkInfo extends StatelessWidget {
  const WorkInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<TaskCubit, TasksState>(
        builder: (context, state) {
          if (state.task == null)
            return Center(
              child: Text('На сегодня задач нет'),
            );
          final task = state.task!;
          final isFinish = task.currentStep == task.steps.length - 1 ||
              task.status == StatusTask.finish;
          log('текущий номер шага ' + task.currentStep.toString());
          log('isFinish $isFinish');
          final stepNumber =
              isFinish ? task.steps.length - 1 : task.currentStep!;
          log(task.status.name);
// не успеваю, пришлось хардколить
          final bool isTo =
              task.steps[stepNumber].name.toLowerCase().contains('осмотр');

          final bool isRoad =
              task.steps[stepNumber].name.toLowerCase().contains('дорог');

          final bool isWork =
              task.steps[stepNumber].name.toLowerCase().contains('работ');
          final bool isReturn =
              task.steps[stepNumber].name.toLowerCase().contains('возвращ');

          void done() {
            context
                .read<TaskCubit>()
                .updateStatusStep(StatusStep.complete, task.currentStep!);
            context.read<TaskCubit>().updateCurrentStepIndex();
          }

          return Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                  width: double.infinity,
                  color: Colors.grey.shade400,
                  child: Text(
                    task.type.name,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${stepNumber + 1} из ${task.steps.length}'),
                          const SizedBox(height: 4),
                          Text(
                            task.steps[stepNumber].name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          // Text(task.steps[stepNumber].description),
                          isTo
                              ? Expanded(
                                  child: Column(
                                    children: [
                                      CheckboxListTile(
                                        value: state.look,
                                        onChanged: (value) {
                                          context
                                              .read<TaskCubit>()
                                              .toggleLook();
                                        },
                                        title: Text('Осмотр и очистка'),
                                      ),
                                      CheckboxListTile(
                                        value: state.to,
                                        onChanged: (value) {
                                          context.read<TaskCubit>().toggleTo();
                                        },
                                        title: Text('Смазка и обслуживание'),
                                      ),
                                      CheckboxListTile(
                                        value: state.check,
                                        onChanged: (value) {
                                          context
                                              .read<TaskCubit>()
                                              .toggleCheck();
                                        },
                                        title: Text('Проверка систем'),
                                      ),
                                      CheckboxListTile(
                                        value: state.setting,
                                        onChanged: (value) {
                                          context
                                              .read<TaskCubit>()
                                              .toggleSetting();
                                        },
                                        title: Text('Настройка и калибровка'),
                                      ),
                                      CheckboxListTile(
                                        value: state.run,
                                        onChanged: (value) {
                                          context.read<TaskCubit>().toggleRun();
                                        },
                                        title: Text('Тестовый запуск'),
                                      ),
                                    ],
                                  ),
                                )
                              : isRoad
                                  ? Expanded(
                                      child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            task.steps[stepNumber].description),
                                        const SizedBox(height: 12),
                                        Text(
                                          'Дополнительная информация',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        const SizedBox(height: 8),
                                        ListTile(
                                          visualDensity:
                                              VisualDensity.comfortable,
                                          title: Text(state.task!.field),
                                          subtitle: const Text('Поле'),
                                          trailing: IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.navigation)),
                                        )
                                      ],
                                    ))
                                  : isWork
                                      ? Expanded(
                                          child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Дополнительная информация',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                            const SizedBox(height: 8),
                                            ListTile(
                                              visualDensity:
                                                  VisualDensity.comfortable,
                                              title: Text('2-3 см'),
                                              subtitle: const Text('Глубина'),
                                            ),
                                            ListTile(
                                              visualDensity:
                                                  VisualDensity.comfortable,
                                              title: Text('8-12 км/ч'),
                                              subtitle: const Text(
                                                  'Рабочая скорость'),
                                            )
                                          ],
                                        ))
                                      : isReturn
                                          ? Text(task
                                              .steps[stepNumber].description)
                                          : SizedBox(),
                        ],
                      ),
                      Positioned(
                        bottom: 6,
                        right: 0,
                        left: 0,
                        child: isFinish
                            ? SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      context
                                          .read<TaskCubit>()
                                          .updateStatusStep(StatusStep.complete,
                                              task.currentStep!);
                                      context
                                          .read<TaskCubit>()
                                          .updateCurrentStepIndex();
                                      await showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                                title: const Center(
                                                    child: Text('Ура!')),
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: <Widget>[
                                                      Text(
                                                        'Сегодня ты проделал отличную работу и заработал неплохую сумму',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                      const SizedBox(
                                                          height: 16),
                                                      Text('+2050 руб',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleLarge!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          36)),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                        '60 га / 8 часов',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                                color: Colors
                                                                    .black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: ElevatedButton(
                                                      child:
                                                          const Text('Закрыть'),
                                                      onPressed: () {
                                                        context
                                                            .read<TaskCubit>()
                                                            .newNewTask();

                                                        context
                                                            .read<AppCubit>()
                                                            .updateWork(
                                                                Work.none);
                                                        context
                                                            .read<AppCubit>()
                                                            .updateTab(AppTabs
                                                                .profile);
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ));
                                      if (context.mounted) {
                                        context.read<TaskCubit>().newNewTask();
                                        context
                                            .read<AppCubit>()
                                            .updateWork(Work.none);
                                        context
                                            .read<AppCubit>()
                                            .updateTab(AppTabs.profile);
                                      }
                                    },
                                    child: const Text('Завершть работу')),
                              )
                            : task.steps[stepNumber].status == StatusStep.fail
                                ? Column(
                                    children: [
                                      FloatingActionButton.large(
                                        onPressed: () {},
                                        child: Icon(Icons.call),
                                      ),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        width: double.infinity,
                                        child: OutlinedButton(
                                            onPressed: () {
                                              context
                                                  .read<TaskCubit>()
                                                  .updateStatusStep(
                                                      StatusStep.inprogress,
                                                      task.currentStep!);
                                            },
                                            child: Text('Проблема решена')),
                                      )
                                    ],
                                  )
                                : Column(
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            onPressed: isTo
                                                ? (state.look &&
                                                        state.to &&
                                                        state.check &&
                                                        state.setting &&
                                                        state.run)
                                                    ? () {
                                                        done();
                                                      }
                                                    : null
                                                : () {
                                                    done();
                                                  },
                                            child: const Text('Готово')),
                                      ),
                                      const SizedBox(height: 4),
                                      SizedBox(
                                        width: double.infinity,
                                        child: OutlinedButton(
                                            onPressed: () {
                                              context
                                                  .read<TaskCubit>()
                                                  .updateStatusStep(
                                                      StatusStep.fail,
                                                      task.currentStep!);
                                            },
                                            child: const Text(
                                                'Не могу завершить')),
                                      ),
                                    ],
                                  ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

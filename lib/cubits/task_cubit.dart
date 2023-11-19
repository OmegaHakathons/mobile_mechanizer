import 'dart:developer';

import 'package:agro_mech/data/mok.dart';
import 'package:agro_mech/models/task/status_step.dart';
import 'package:agro_mech/models/task/status_task.dart';
import 'package:agro_mech/models/task/step_custom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/utils.dart';
import '../models/state/tasks_state.dart';
import '../models/task/task.dart';

class TaskCubit extends Cubit<TasksState> {
  TaskCubit()
      : super(TasksState(
            tasks: allTasks,
            task: allTasks
                    .where((element) =>
                        getYearMonthDay(element.deadline) ==
                            getYearMonthDay(DateTime.now()) &&
                        element.status != StatusTask.finish)
                    .toList()
                    .isNotEmpty
                ? allTasks
                    .where((element) =>
                        getYearMonthDay(element.deadline) ==
                            getYearMonthDay(DateTime.now()) &&
                        element.status != StatusTask.finish)
                    .toList()[0]
                : null));

  void updateStatusStep(StatusStep newStatus, int stepIndex) {
    List<StepCustom> newSteps = [
      for (final step in state.task!.steps)
        if (step.index == stepIndex) step.copyWith(status: newStatus) else step,
    ];

    List<Task> newState = [
      for (final taskk in state.tasks)
        if (taskk == state.task!)
          taskk.copyWith(
              steps: newSteps,
              status: newStatus == StatusStep.fail
                  ? StatusTask.problem
                  : taskk.status)
        else
          taskk,
    ];
    emit(
      state.copyWith(
        tasks: newState,
        task: state.task!.copyWith(steps: newSteps),
      ),
    );
  }

  void newNewTask() {
    Task? newT = state.tasks
            .where((element) =>
                getYearMonthDay(element.deadline) ==
                    getYearMonthDay(DateTime.now()) &&
                element.status != StatusTask.finish)
            .toList()
            .isNotEmpty
        ? state.tasks
            .where((element) =>
                getYearMonthDay(element.deadline) ==
                    getYearMonthDay(DateTime.now()) &&
                element.status != StatusTask.finish)
            .toList()[0]
        : null;
    emit(state.copyWith(task: newT));
  }

  void updateCurrentStepIndex() {
    log('обновляем индекс текущий');
    log(state.task!.currentStep.toString());
    log('-------');
    List<Task> newState = [];
    if (state.task!.currentStep == null) {
      log('task!.currentStep == null');
      newState = [
        for (final taskk in state.tasks)
          if (taskk.id == state.task!.id)
            taskk.copyWith(currentStep: 0, status: StatusTask.to)
          else
            taskk,
      ];
    } else if (state.task!.currentStep! >= state.task!.steps.length - 1) {
      log('task!.currentStep! >= task!.steps.length - 1');
      newState = [
        for (final taskk in state.tasks)
          if (taskk.id == state.task!.id)
            taskk.copyWith(
              currentStep: null,
              status: StatusTask.finish,
              money: 2050,
            )
          else
            taskk,
      ];
    } else {
      log('ghjcnj cktle.obq ifu');
      newState = [
        for (final taskk in state.tasks)
          if (taskk.id == state.task!.id)
            taskk.copyWith(
                currentStep: state.task!.currentStep! + 1,
                status: StatusTask.process)
          else
            taskk,
      ];
    }
    log(state.task?.currentStep.toString() ?? 'null');
    emit(
      state.copyWith(
        tasks: newState,
        task: newState.firstWhere((element) => element.id == state.task!.id),
      ),
    );
  }

  void toggleLook() {
    emit(
      state.copyWith(
        look: !state.look,
      ),
    );
  }

  void toggleTo() {
    emit(
      state.copyWith(
        to: !state.to,
      ),
    );
  }

  void toggleCheck() {
    emit(
      state.copyWith(
        check: !state.check,
      ),
    );
  }

  void toggleSetting() {
    emit(
      state.copyWith(
        setting: !state.setting,
      ),
    );
  }

  void toggleRun() {
    emit(
      state.copyWith(
        run: !state.run,
      ),
    );
  }
}

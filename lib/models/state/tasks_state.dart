import 'package:freezed_annotation/freezed_annotation.dart';

import '../task/task.dart';

part 'tasks_state.freezed.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState({
    Task? task,
    required List<Task> tasks,
  }) = _TasksState;
}

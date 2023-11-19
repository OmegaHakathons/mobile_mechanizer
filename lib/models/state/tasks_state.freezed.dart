// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TasksState {
  Task? get task => throw _privateConstructorUsedError;
  List<Task> get tasks => throw _privateConstructorUsedError;
  bool get look => throw _privateConstructorUsedError;
  bool get to => throw _privateConstructorUsedError;
  bool get check => throw _privateConstructorUsedError;
  bool get setting => throw _privateConstructorUsedError;
  bool get run => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TasksStateCopyWith<TasksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksStateCopyWith<$Res> {
  factory $TasksStateCopyWith(
          TasksState value, $Res Function(TasksState) then) =
      _$TasksStateCopyWithImpl<$Res, TasksState>;
  @useResult
  $Res call(
      {Task? task,
      List<Task> tasks,
      bool look,
      bool to,
      bool check,
      bool setting,
      bool run});

  $TaskCopyWith<$Res>? get task;
}

/// @nodoc
class _$TasksStateCopyWithImpl<$Res, $Val extends TasksState>
    implements $TasksStateCopyWith<$Res> {
  _$TasksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
    Object? tasks = null,
    Object? look = null,
    Object? to = null,
    Object? check = null,
    Object? setting = null,
    Object? run = null,
  }) {
    return _then(_value.copyWith(
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task?,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      look: null == look
          ? _value.look
          : look // ignore: cast_nullable_to_non_nullable
              as bool,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as bool,
      check: null == check
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as bool,
      setting: null == setting
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as bool,
      run: null == run
          ? _value.run
          : run // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res>? get task {
    if (_value.task == null) {
      return null;
    }

    return $TaskCopyWith<$Res>(_value.task!, (value) {
      return _then(_value.copyWith(task: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TasksStateImplCopyWith<$Res>
    implements $TasksStateCopyWith<$Res> {
  factory _$$TasksStateImplCopyWith(
          _$TasksStateImpl value, $Res Function(_$TasksStateImpl) then) =
      __$$TasksStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Task? task,
      List<Task> tasks,
      bool look,
      bool to,
      bool check,
      bool setting,
      bool run});

  @override
  $TaskCopyWith<$Res>? get task;
}

/// @nodoc
class __$$TasksStateImplCopyWithImpl<$Res>
    extends _$TasksStateCopyWithImpl<$Res, _$TasksStateImpl>
    implements _$$TasksStateImplCopyWith<$Res> {
  __$$TasksStateImplCopyWithImpl(
      _$TasksStateImpl _value, $Res Function(_$TasksStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
    Object? tasks = null,
    Object? look = null,
    Object? to = null,
    Object? check = null,
    Object? setting = null,
    Object? run = null,
  }) {
    return _then(_$TasksStateImpl(
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task?,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      look: null == look
          ? _value.look
          : look // ignore: cast_nullable_to_non_nullable
              as bool,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as bool,
      check: null == check
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as bool,
      setting: null == setting
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as bool,
      run: null == run
          ? _value.run
          : run // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TasksStateImpl implements _TasksState {
  const _$TasksStateImpl(
      {this.task,
      required final List<Task> tasks,
      this.look = false,
      this.to = false,
      this.check = false,
      this.setting = false,
      this.run = false})
      : _tasks = tasks;

  @override
  final Task? task;
  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  @JsonKey()
  final bool look;
  @override
  @JsonKey()
  final bool to;
  @override
  @JsonKey()
  final bool check;
  @override
  @JsonKey()
  final bool setting;
  @override
  @JsonKey()
  final bool run;

  @override
  String toString() {
    return 'TasksState(task: $task, tasks: $tasks, look: $look, to: $to, check: $check, setting: $setting, run: $run)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksStateImpl &&
            (identical(other.task, task) || other.task == task) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.look, look) || other.look == look) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.check, check) || other.check == check) &&
            (identical(other.setting, setting) || other.setting == setting) &&
            (identical(other.run, run) || other.run == run));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      task,
      const DeepCollectionEquality().hash(_tasks),
      look,
      to,
      check,
      setting,
      run);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksStateImplCopyWith<_$TasksStateImpl> get copyWith =>
      __$$TasksStateImplCopyWithImpl<_$TasksStateImpl>(this, _$identity);
}

abstract class _TasksState implements TasksState {
  const factory _TasksState(
      {final Task? task,
      required final List<Task> tasks,
      final bool look,
      final bool to,
      final bool check,
      final bool setting,
      final bool run}) = _$TasksStateImpl;

  @override
  Task? get task;
  @override
  List<Task> get tasks;
  @override
  bool get look;
  @override
  bool get to;
  @override
  bool get check;
  @override
  bool get setting;
  @override
  bool get run;
  @override
  @JsonKey(ignore: true)
  _$$TasksStateImplCopyWith<_$TasksStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

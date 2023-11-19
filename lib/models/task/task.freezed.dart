// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  @HiveField(1)
  TypeTask get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'shortDescription')
  @HiveField(2)
  String get shortDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'steps')
  @HiveField(3)
  List<StepCustom> get steps => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentStep')
  @HiveField(4)
  int? get currentStep => throw _privateConstructorUsedError;
  @JsonKey(name: 'car')
  @HiveField(5)
  Car? get car => throw _privateConstructorUsedError;
  @JsonKey(name: 'aggregate')
  @HiveField(6)
  Aggregate? get aggregate => throw _privateConstructorUsedError;
  @JsonKey(name: 'field')
  @HiveField(7)
  String get field =>
      throw _privateConstructorUsedError; // пока просто, в будущем класс с местоположением
  @JsonKey(name: 'minSpeed')
  @HiveField(8)
  int get minSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxSpeed')
  @HiveField(9)
  int get maxSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'depth')
  @HiveField(10)
  int? get depth => throw _privateConstructorUsedError;
  @JsonKey(name: 'material')
  @HiveField(11)
  String? get material => throw _privateConstructorUsedError;
  @JsonKey(name: 'consumption')
  @HiveField(12)
  int? get consumption => throw _privateConstructorUsedError;
  @JsonKey(name: 'deadline')
  @HiveField(13)
  DateTime get deadline => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  @HiveField(14)
  StatusTask get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'executor')
  @HiveField(15)
  String? get executor =>
      throw _privateConstructorUsedError; // ПЕРЕДЕЛАТЬ НА КЛАСС !!!!!!!!!!!!!!!!!!!!
  @JsonKey(name: 'money')
  @HiveField(16)
  int? get money => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'type') @HiveField(1) TypeTask type,
      @JsonKey(name: 'shortDescription') @HiveField(2) String shortDescription,
      @JsonKey(name: 'steps') @HiveField(3) List<StepCustom> steps,
      @JsonKey(name: 'currentStep') @HiveField(4) int? currentStep,
      @JsonKey(name: 'car') @HiveField(5) Car? car,
      @JsonKey(name: 'aggregate') @HiveField(6) Aggregate? aggregate,
      @JsonKey(name: 'field') @HiveField(7) String field,
      @JsonKey(name: 'minSpeed') @HiveField(8) int minSpeed,
      @JsonKey(name: 'maxSpeed') @HiveField(9) int maxSpeed,
      @JsonKey(name: 'depth') @HiveField(10) int? depth,
      @JsonKey(name: 'material') @HiveField(11) String? material,
      @JsonKey(name: 'consumption') @HiveField(12) int? consumption,
      @JsonKey(name: 'deadline') @HiveField(13) DateTime deadline,
      @JsonKey(name: 'status') @HiveField(14) StatusTask status,
      @JsonKey(name: 'executor') @HiveField(15) String? executor,
      @JsonKey(name: 'money') @HiveField(16) int? money});

  $CarCopyWith<$Res>? get car;
  $AggregateCopyWith<$Res>? get aggregate;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? shortDescription = null,
    Object? steps = null,
    Object? currentStep = freezed,
    Object? car = freezed,
    Object? aggregate = freezed,
    Object? field = null,
    Object? minSpeed = null,
    Object? maxSpeed = null,
    Object? depth = freezed,
    Object? material = freezed,
    Object? consumption = freezed,
    Object? deadline = null,
    Object? status = null,
    Object? executor = freezed,
    Object? money = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeTask,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StepCustom>,
      currentStep: freezed == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int?,
      car: freezed == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as Car?,
      aggregate: freezed == aggregate
          ? _value.aggregate
          : aggregate // ignore: cast_nullable_to_non_nullable
              as Aggregate?,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      minSpeed: null == minSpeed
          ? _value.minSpeed
          : minSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      maxSpeed: null == maxSpeed
          ? _value.maxSpeed
          : maxSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      depth: freezed == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int?,
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as String?,
      consumption: freezed == consumption
          ? _value.consumption
          : consumption // ignore: cast_nullable_to_non_nullable
              as int?,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusTask,
      executor: freezed == executor
          ? _value.executor
          : executor // ignore: cast_nullable_to_non_nullable
              as String?,
      money: freezed == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CarCopyWith<$Res>? get car {
    if (_value.car == null) {
      return null;
    }

    return $CarCopyWith<$Res>(_value.car!, (value) {
      return _then(_value.copyWith(car: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AggregateCopyWith<$Res>? get aggregate {
    if (_value.aggregate == null) {
      return null;
    }

    return $AggregateCopyWith<$Res>(_value.aggregate!, (value) {
      return _then(_value.copyWith(aggregate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') @HiveField(0) int id,
      @JsonKey(name: 'type') @HiveField(1) TypeTask type,
      @JsonKey(name: 'shortDescription') @HiveField(2) String shortDescription,
      @JsonKey(name: 'steps') @HiveField(3) List<StepCustom> steps,
      @JsonKey(name: 'currentStep') @HiveField(4) int? currentStep,
      @JsonKey(name: 'car') @HiveField(5) Car? car,
      @JsonKey(name: 'aggregate') @HiveField(6) Aggregate? aggregate,
      @JsonKey(name: 'field') @HiveField(7) String field,
      @JsonKey(name: 'minSpeed') @HiveField(8) int minSpeed,
      @JsonKey(name: 'maxSpeed') @HiveField(9) int maxSpeed,
      @JsonKey(name: 'depth') @HiveField(10) int? depth,
      @JsonKey(name: 'material') @HiveField(11) String? material,
      @JsonKey(name: 'consumption') @HiveField(12) int? consumption,
      @JsonKey(name: 'deadline') @HiveField(13) DateTime deadline,
      @JsonKey(name: 'status') @HiveField(14) StatusTask status,
      @JsonKey(name: 'executor') @HiveField(15) String? executor,
      @JsonKey(name: 'money') @HiveField(16) int? money});

  @override
  $CarCopyWith<$Res>? get car;
  @override
  $AggregateCopyWith<$Res>? get aggregate;
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? shortDescription = null,
    Object? steps = null,
    Object? currentStep = freezed,
    Object? car = freezed,
    Object? aggregate = freezed,
    Object? field = null,
    Object? minSpeed = null,
    Object? maxSpeed = null,
    Object? depth = freezed,
    Object? material = freezed,
    Object? consumption = freezed,
    Object? deadline = null,
    Object? status = null,
    Object? executor = freezed,
    Object? money = freezed,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TypeTask,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<StepCustom>,
      currentStep: freezed == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int?,
      car: freezed == car
          ? _value.car
          : car // ignore: cast_nullable_to_non_nullable
              as Car?,
      aggregate: freezed == aggregate
          ? _value.aggregate
          : aggregate // ignore: cast_nullable_to_non_nullable
              as Aggregate?,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as String,
      minSpeed: null == minSpeed
          ? _value.minSpeed
          : minSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      maxSpeed: null == maxSpeed
          ? _value.maxSpeed
          : maxSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      depth: freezed == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int?,
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as String?,
      consumption: freezed == consumption
          ? _value.consumption
          : consumption // ignore: cast_nullable_to_non_nullable
              as int?,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusTask,
      executor: freezed == executor
          ? _value.executor
          : executor // ignore: cast_nullable_to_non_nullable
              as String?,
      money: freezed == money
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 21, adapterName: 'TaskAdapter')
class _$TaskImpl implements _Task {
  const _$TaskImpl(
      {@JsonKey(name: 'id') @HiveField(0) required this.id,
      @JsonKey(name: 'type') @HiveField(1) required this.type,
      @JsonKey(name: 'shortDescription')
      @HiveField(2)
      required this.shortDescription,
      @JsonKey(name: 'steps')
      @HiveField(3)
      required final List<StepCustom> steps,
      @JsonKey(name: 'currentStep') @HiveField(4) this.currentStep,
      @JsonKey(name: 'car') @HiveField(5) this.car,
      @JsonKey(name: 'aggregate') @HiveField(6) this.aggregate,
      @JsonKey(name: 'field') @HiveField(7) required this.field,
      @JsonKey(name: 'minSpeed') @HiveField(8) required this.minSpeed,
      @JsonKey(name: 'maxSpeed') @HiveField(9) required this.maxSpeed,
      @JsonKey(name: 'depth') @HiveField(10) this.depth,
      @JsonKey(name: 'material') @HiveField(11) this.material,
      @JsonKey(name: 'consumption') @HiveField(12) this.consumption,
      @JsonKey(name: 'deadline') @HiveField(13) required this.deadline,
      @JsonKey(name: 'status') @HiveField(14) required this.status,
      @JsonKey(name: 'executor') @HiveField(15) this.executor,
      @JsonKey(name: 'money') @HiveField(16) this.money})
      : _steps = steps;

  factory _$TaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  final int id;
  @override
  @JsonKey(name: 'type')
  @HiveField(1)
  final TypeTask type;
  @override
  @JsonKey(name: 'shortDescription')
  @HiveField(2)
  final String shortDescription;
  final List<StepCustom> _steps;
  @override
  @JsonKey(name: 'steps')
  @HiveField(3)
  List<StepCustom> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  @JsonKey(name: 'currentStep')
  @HiveField(4)
  final int? currentStep;
  @override
  @JsonKey(name: 'car')
  @HiveField(5)
  final Car? car;
  @override
  @JsonKey(name: 'aggregate')
  @HiveField(6)
  final Aggregate? aggregate;
  @override
  @JsonKey(name: 'field')
  @HiveField(7)
  final String field;
// пока просто, в будущем класс с местоположением
  @override
  @JsonKey(name: 'minSpeed')
  @HiveField(8)
  final int minSpeed;
  @override
  @JsonKey(name: 'maxSpeed')
  @HiveField(9)
  final int maxSpeed;
  @override
  @JsonKey(name: 'depth')
  @HiveField(10)
  final int? depth;
  @override
  @JsonKey(name: 'material')
  @HiveField(11)
  final String? material;
  @override
  @JsonKey(name: 'consumption')
  @HiveField(12)
  final int? consumption;
  @override
  @JsonKey(name: 'deadline')
  @HiveField(13)
  final DateTime deadline;
  @override
  @JsonKey(name: 'status')
  @HiveField(14)
  final StatusTask status;
  @override
  @JsonKey(name: 'executor')
  @HiveField(15)
  final String? executor;
// ПЕРЕДЕЛАТЬ НА КЛАСС !!!!!!!!!!!!!!!!!!!!
  @override
  @JsonKey(name: 'money')
  @HiveField(16)
  final int? money;

  @override
  String toString() {
    return 'Task(id: $id, type: $type, shortDescription: $shortDescription, steps: $steps, currentStep: $currentStep, car: $car, aggregate: $aggregate, field: $field, minSpeed: $minSpeed, maxSpeed: $maxSpeed, depth: $depth, material: $material, consumption: $consumption, deadline: $deadline, status: $status, executor: $executor, money: $money)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.car, car) || other.car == car) &&
            (identical(other.aggregate, aggregate) ||
                other.aggregate == aggregate) &&
            (identical(other.field, field) || other.field == field) &&
            (identical(other.minSpeed, minSpeed) ||
                other.minSpeed == minSpeed) &&
            (identical(other.maxSpeed, maxSpeed) ||
                other.maxSpeed == maxSpeed) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.consumption, consumption) ||
                other.consumption == consumption) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.executor, executor) ||
                other.executor == executor) &&
            (identical(other.money, money) || other.money == money));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      shortDescription,
      const DeepCollectionEquality().hash(_steps),
      currentStep,
      car,
      aggregate,
      field,
      minSpeed,
      maxSpeed,
      depth,
      material,
      consumption,
      deadline,
      status,
      executor,
      money);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskImplToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {@JsonKey(name: 'id') @HiveField(0) required final int id,
      @JsonKey(name: 'type') @HiveField(1) required final TypeTask type,
      @JsonKey(name: 'shortDescription')
      @HiveField(2)
      required final String shortDescription,
      @JsonKey(name: 'steps')
      @HiveField(3)
      required final List<StepCustom> steps,
      @JsonKey(name: 'currentStep') @HiveField(4) final int? currentStep,
      @JsonKey(name: 'car') @HiveField(5) final Car? car,
      @JsonKey(name: 'aggregate') @HiveField(6) final Aggregate? aggregate,
      @JsonKey(name: 'field') @HiveField(7) required final String field,
      @JsonKey(name: 'minSpeed') @HiveField(8) required final int minSpeed,
      @JsonKey(name: 'maxSpeed') @HiveField(9) required final int maxSpeed,
      @JsonKey(name: 'depth') @HiveField(10) final int? depth,
      @JsonKey(name: 'material') @HiveField(11) final String? material,
      @JsonKey(name: 'consumption') @HiveField(12) final int? consumption,
      @JsonKey(name: 'deadline')
      @HiveField(13)
      required final DateTime deadline,
      @JsonKey(name: 'status') @HiveField(14) required final StatusTask status,
      @JsonKey(name: 'executor') @HiveField(15) final String? executor,
      @JsonKey(name: 'money') @HiveField(16) final int? money}) = _$TaskImpl;

  factory _Task.fromJson(Map<String, dynamic> json) = _$TaskImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  @HiveField(0)
  int get id;
  @override
  @JsonKey(name: 'type')
  @HiveField(1)
  TypeTask get type;
  @override
  @JsonKey(name: 'shortDescription')
  @HiveField(2)
  String get shortDescription;
  @override
  @JsonKey(name: 'steps')
  @HiveField(3)
  List<StepCustom> get steps;
  @override
  @JsonKey(name: 'currentStep')
  @HiveField(4)
  int? get currentStep;
  @override
  @JsonKey(name: 'car')
  @HiveField(5)
  Car? get car;
  @override
  @JsonKey(name: 'aggregate')
  @HiveField(6)
  Aggregate? get aggregate;
  @override
  @JsonKey(name: 'field')
  @HiveField(7)
  String get field;
  @override // пока просто, в будущем класс с местоположением
  @JsonKey(name: 'minSpeed')
  @HiveField(8)
  int get minSpeed;
  @override
  @JsonKey(name: 'maxSpeed')
  @HiveField(9)
  int get maxSpeed;
  @override
  @JsonKey(name: 'depth')
  @HiveField(10)
  int? get depth;
  @override
  @JsonKey(name: 'material')
  @HiveField(11)
  String? get material;
  @override
  @JsonKey(name: 'consumption')
  @HiveField(12)
  int? get consumption;
  @override
  @JsonKey(name: 'deadline')
  @HiveField(13)
  DateTime get deadline;
  @override
  @JsonKey(name: 'status')
  @HiveField(14)
  StatusTask get status;
  @override
  @JsonKey(name: 'executor')
  @HiveField(15)
  String? get executor;
  @override // ПЕРЕДЕЛАТЬ НА КЛАСС !!!!!!!!!!!!!!!!!!!!
  @JsonKey(name: 'money')
  @HiveField(16)
  int? get money;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

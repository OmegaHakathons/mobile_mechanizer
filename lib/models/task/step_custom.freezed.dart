// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_custom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StepCustom _$StepCustomFromJson(Map<String, dynamic> json) {
  return _StepCustom.fromJson(json);
}

/// @nodoc
mixin _$StepCustom {
  @JsonKey(name: 'index')
  @HiveField(0)
  int get index => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  @HiveField(3)
  StatusStep get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment')
  @HiveField(4)
  String? get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepCustomCopyWith<StepCustom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepCustomCopyWith<$Res> {
  factory $StepCustomCopyWith(
          StepCustom value, $Res Function(StepCustom) then) =
      _$StepCustomCopyWithImpl<$Res, StepCustom>;
  @useResult
  $Res call(
      {@JsonKey(name: 'index') @HiveField(0) int index,
      @JsonKey(name: 'name') @HiveField(1) String name,
      @JsonKey(name: 'description') @HiveField(2) String description,
      @JsonKey(name: 'status') @HiveField(3) StatusStep status,
      @JsonKey(name: 'comment') @HiveField(4) String? comment});
}

/// @nodoc
class _$StepCustomCopyWithImpl<$Res, $Val extends StepCustom>
    implements $StepCustomCopyWith<$Res> {
  _$StepCustomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? name = null,
    Object? description = null,
    Object? status = null,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusStep,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepCustomImplCopyWith<$Res>
    implements $StepCustomCopyWith<$Res> {
  factory _$$StepCustomImplCopyWith(
          _$StepCustomImpl value, $Res Function(_$StepCustomImpl) then) =
      __$$StepCustomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'index') @HiveField(0) int index,
      @JsonKey(name: 'name') @HiveField(1) String name,
      @JsonKey(name: 'description') @HiveField(2) String description,
      @JsonKey(name: 'status') @HiveField(3) StatusStep status,
      @JsonKey(name: 'comment') @HiveField(4) String? comment});
}

/// @nodoc
class __$$StepCustomImplCopyWithImpl<$Res>
    extends _$StepCustomCopyWithImpl<$Res, _$StepCustomImpl>
    implements _$$StepCustomImplCopyWith<$Res> {
  __$$StepCustomImplCopyWithImpl(
      _$StepCustomImpl _value, $Res Function(_$StepCustomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? name = null,
    Object? description = null,
    Object? status = null,
    Object? comment = freezed,
  }) {
    return _then(_$StepCustomImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusStep,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 23, adapterName: 'StepCustomAdapter')
class _$StepCustomImpl implements _StepCustom {
  const _$StepCustomImpl(
      {@JsonKey(name: 'index') @HiveField(0) required this.index,
      @JsonKey(name: 'name') @HiveField(1) required this.name,
      @JsonKey(name: 'description') @HiveField(2) required this.description,
      @JsonKey(name: 'status') @HiveField(3) required this.status,
      @JsonKey(name: 'comment') @HiveField(4) this.comment});

  factory _$StepCustomImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepCustomImplFromJson(json);

  @override
  @JsonKey(name: 'index')
  @HiveField(0)
  final int index;
  @override
  @JsonKey(name: 'name')
  @HiveField(1)
  final String name;
  @override
  @JsonKey(name: 'description')
  @HiveField(2)
  final String description;
  @override
  @JsonKey(name: 'status')
  @HiveField(3)
  final StatusStep status;
  @override
  @JsonKey(name: 'comment')
  @HiveField(4)
  final String? comment;

  @override
  String toString() {
    return 'StepCustom(index: $index, name: $name, description: $description, status: $status, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepCustomImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, index, name, description, status, comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepCustomImplCopyWith<_$StepCustomImpl> get copyWith =>
      __$$StepCustomImplCopyWithImpl<_$StepCustomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StepCustomImplToJson(
      this,
    );
  }
}

abstract class _StepCustom implements StepCustom {
  const factory _StepCustom(
      {@JsonKey(name: 'index') @HiveField(0) required final int index,
      @JsonKey(name: 'name') @HiveField(1) required final String name,
      @JsonKey(name: 'description')
      @HiveField(2)
      required final String description,
      @JsonKey(name: 'status') @HiveField(3) required final StatusStep status,
      @JsonKey(name: 'comment')
      @HiveField(4)
      final String? comment}) = _$StepCustomImpl;

  factory _StepCustom.fromJson(Map<String, dynamic> json) =
      _$StepCustomImpl.fromJson;

  @override
  @JsonKey(name: 'index')
  @HiveField(0)
  int get index;
  @override
  @JsonKey(name: 'name')
  @HiveField(1)
  String get name;
  @override
  @JsonKey(name: 'description')
  @HiveField(2)
  String get description;
  @override
  @JsonKey(name: 'status')
  @HiveField(3)
  StatusStep get status;
  @override
  @JsonKey(name: 'comment')
  @HiveField(4)
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$$StepCustomImplCopyWith<_$StepCustomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

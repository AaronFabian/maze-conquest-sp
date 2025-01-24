// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Statistic _$StatisticFromJson(Map<String, dynamic> json) {
  return _Statistic.fromJson(json);
}

/// @nodoc
mixin _$Statistic {
  String get label => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  /// Serializes this Statistic to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Statistic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatisticCopyWith<Statistic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticCopyWith<$Res> {
  factory $StatisticCopyWith(Statistic value, $Res Function(Statistic) then) =
      _$StatisticCopyWithImpl<$Res, Statistic>;
  @useResult
  $Res call({String label, double value});
}

/// @nodoc
class _$StatisticCopyWithImpl<$Res, $Val extends Statistic>
    implements $StatisticCopyWith<$Res> {
  _$StatisticCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Statistic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatisticImplCopyWith<$Res>
    implements $StatisticCopyWith<$Res> {
  factory _$$StatisticImplCopyWith(
          _$StatisticImpl value, $Res Function(_$StatisticImpl) then) =
      __$$StatisticImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, double value});
}

/// @nodoc
class __$$StatisticImplCopyWithImpl<$Res>
    extends _$StatisticCopyWithImpl<$Res, _$StatisticImpl>
    implements _$$StatisticImplCopyWith<$Res> {
  __$$StatisticImplCopyWithImpl(
      _$StatisticImpl _value, $Res Function(_$StatisticImpl) _then)
      : super(_value, _then);

  /// Create a copy of Statistic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_$StatisticImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatisticImpl implements _Statistic {
  const _$StatisticImpl({required this.label, required this.value});

  factory _$StatisticImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatisticImplFromJson(json);

  @override
  final String label;
  @override
  final double value;

  @override
  String toString() {
    return 'Statistic(label: $label, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  /// Create a copy of Statistic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticImplCopyWith<_$StatisticImpl> get copyWith =>
      __$$StatisticImplCopyWithImpl<_$StatisticImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatisticImplToJson(
      this,
    );
  }
}

abstract class _Statistic implements Statistic {
  const factory _Statistic(
      {required final String label,
      required final double value}) = _$StatisticImpl;

  factory _Statistic.fromJson(Map<String, dynamic> json) =
      _$StatisticImpl.fromJson;

  @override
  String get label;
  @override
  double get value;

  /// Create a copy of Statistic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatisticImplCopyWith<_$StatisticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'world.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

World _$WorldFromJson(Map<String, dynamic> json) {
  return _World.fromJson(json);
}

/// @nodoc
mixin _$World {
  String get name => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  /// Serializes this World to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of World
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorldCopyWith<World> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorldCopyWith<$Res> {
  factory $WorldCopyWith(World value, $Res Function(World) then) =
      _$WorldCopyWithImpl<$Res, World>;
  @useResult
  $Res call({String name, int level});
}

/// @nodoc
class _$WorldCopyWithImpl<$Res, $Val extends World>
    implements $WorldCopyWith<$Res> {
  _$WorldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of World
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? level = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorldImplCopyWith<$Res> implements $WorldCopyWith<$Res> {
  factory _$$WorldImplCopyWith(
          _$WorldImpl value, $Res Function(_$WorldImpl) then) =
      __$$WorldImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int level});
}

/// @nodoc
class __$$WorldImplCopyWithImpl<$Res>
    extends _$WorldCopyWithImpl<$Res, _$WorldImpl>
    implements _$$WorldImplCopyWith<$Res> {
  __$$WorldImplCopyWithImpl(
      _$WorldImpl _value, $Res Function(_$WorldImpl) _then)
      : super(_value, _then);

  /// Create a copy of World
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? level = null,
  }) {
    return _then(_$WorldImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorldImpl implements _World {
  const _$WorldImpl({required this.name, required this.level});

  factory _$WorldImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorldImplFromJson(json);

  @override
  final String name;
  @override
  final int level;

  @override
  String toString() {
    return 'World(name: $name, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorldImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, level);

  /// Create a copy of World
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorldImplCopyWith<_$WorldImpl> get copyWith =>
      __$$WorldImplCopyWithImpl<_$WorldImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorldImplToJson(
      this,
    );
  }
}

abstract class _World implements World {
  const factory _World({required final String name, required final int level}) =
      _$WorldImpl;

  factory _World.fromJson(Map<String, dynamic> json) = _$WorldImpl.fromJson;

  @override
  String get name;
  @override
  int get level;

  /// Create a copy of World
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorldImplCopyWith<_$WorldImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

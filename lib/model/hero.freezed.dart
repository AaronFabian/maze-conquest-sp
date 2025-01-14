// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hero.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Hero _$HeroFromJson(Map<String, dynamic> json) {
  return _Hero.fromJson(json);
}

/// @nodoc
mixin _$Hero {
  String get name => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get currentExp => throw _privateConstructorUsedError;
  int get expToLevel => throw _privateConstructorUsedError;

  /// Serializes this Hero to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Hero
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HeroCopyWith<Hero> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeroCopyWith<$Res> {
  factory $HeroCopyWith(Hero value, $Res Function(Hero) then) =
      _$HeroCopyWithImpl<$Res, Hero>;
  @useResult
  $Res call({String name, int level, int currentExp, int expToLevel});
}

/// @nodoc
class _$HeroCopyWithImpl<$Res, $Val extends Hero>
    implements $HeroCopyWith<$Res> {
  _$HeroCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Hero
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? level = null,
    Object? currentExp = null,
    Object? expToLevel = null,
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
      currentExp: null == currentExp
          ? _value.currentExp
          : currentExp // ignore: cast_nullable_to_non_nullable
              as int,
      expToLevel: null == expToLevel
          ? _value.expToLevel
          : expToLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HeroImplCopyWith<$Res> implements $HeroCopyWith<$Res> {
  factory _$$HeroImplCopyWith(
          _$HeroImpl value, $Res Function(_$HeroImpl) then) =
      __$$HeroImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int level, int currentExp, int expToLevel});
}

/// @nodoc
class __$$HeroImplCopyWithImpl<$Res>
    extends _$HeroCopyWithImpl<$Res, _$HeroImpl>
    implements _$$HeroImplCopyWith<$Res> {
  __$$HeroImplCopyWithImpl(_$HeroImpl _value, $Res Function(_$HeroImpl) _then)
      : super(_value, _then);

  /// Create a copy of Hero
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? level = null,
    Object? currentExp = null,
    Object? expToLevel = null,
  }) {
    return _then(_$HeroImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      currentExp: null == currentExp
          ? _value.currentExp
          : currentExp // ignore: cast_nullable_to_non_nullable
              as int,
      expToLevel: null == expToLevel
          ? _value.expToLevel
          : expToLevel // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeroImpl implements _Hero {
  const _$HeroImpl(
      {required this.name,
      required this.level,
      required this.currentExp,
      required this.expToLevel});

  factory _$HeroImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeroImplFromJson(json);

  @override
  final String name;
  @override
  final int level;
  @override
  final int currentExp;
  @override
  final int expToLevel;

  @override
  String toString() {
    return 'Hero(name: $name, level: $level, currentExp: $currentExp, expToLevel: $expToLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeroImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.currentExp, currentExp) ||
                other.currentExp == currentExp) &&
            (identical(other.expToLevel, expToLevel) ||
                other.expToLevel == expToLevel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, level, currentExp, expToLevel);

  /// Create a copy of Hero
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HeroImplCopyWith<_$HeroImpl> get copyWith =>
      __$$HeroImplCopyWithImpl<_$HeroImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeroImplToJson(
      this,
    );
  }
}

abstract class _Hero implements Hero {
  const factory _Hero(
      {required final String name,
      required final int level,
      required final int currentExp,
      required final int expToLevel}) = _$HeroImpl;

  factory _Hero.fromJson(Map<String, dynamic> json) = _$HeroImpl.fromJson;

  @override
  String get name;
  @override
  int get level;
  @override
  int get currentExp;
  @override
  int get expToLevel;

  /// Create a copy of Hero
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HeroImplCopyWith<_$HeroImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mix_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MixStats _$MixStatsFromJson(Map<String, dynamic> json) {
  return _MixStats.fromJson(json);
}

/// @nodoc
mixin _$MixStats {
  String get uid => throw _privateConstructorUsedError;
  int get power => throw _privateConstructorUsedError;
  String get ownerUsername => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;

  /// Serializes this MixStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MixStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MixStatsCopyWith<MixStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MixStatsCopyWith<$Res> {
  factory $MixStatsCopyWith(MixStats value, $Res Function(MixStats) then) =
      _$MixStatsCopyWithImpl<$Res, MixStats>;
  @useResult
  $Res call({String uid, int power, String ownerUsername, String photoUrl});
}

/// @nodoc
class _$MixStatsCopyWithImpl<$Res, $Val extends MixStats>
    implements $MixStatsCopyWith<$Res> {
  _$MixStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MixStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? power = null,
    Object? ownerUsername = null,
    Object? photoUrl = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      power: null == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int,
      ownerUsername: null == ownerUsername
          ? _value.ownerUsername
          : ownerUsername // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MixStatsImplCopyWith<$Res>
    implements $MixStatsCopyWith<$Res> {
  factory _$$MixStatsImplCopyWith(
          _$MixStatsImpl value, $Res Function(_$MixStatsImpl) then) =
      __$$MixStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, int power, String ownerUsername, String photoUrl});
}

/// @nodoc
class __$$MixStatsImplCopyWithImpl<$Res>
    extends _$MixStatsCopyWithImpl<$Res, _$MixStatsImpl>
    implements _$$MixStatsImplCopyWith<$Res> {
  __$$MixStatsImplCopyWithImpl(
      _$MixStatsImpl _value, $Res Function(_$MixStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MixStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? power = null,
    Object? ownerUsername = null,
    Object? photoUrl = null,
  }) {
    return _then(_$MixStatsImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      power: null == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int,
      ownerUsername: null == ownerUsername
          ? _value.ownerUsername
          : ownerUsername // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MixStatsImpl extends _MixStats {
  const _$MixStatsImpl(
      {required this.uid,
      required this.power,
      required this.ownerUsername,
      required this.photoUrl})
      : super._();

  factory _$MixStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MixStatsImplFromJson(json);

  @override
  final String uid;
  @override
  final int power;
  @override
  final String ownerUsername;
  @override
  final String photoUrl;

  @override
  String toString() {
    return 'MixStats(uid: $uid, power: $power, ownerUsername: $ownerUsername, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MixStatsImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.power, power) || other.power == power) &&
            (identical(other.ownerUsername, ownerUsername) ||
                other.ownerUsername == ownerUsername) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, power, ownerUsername, photoUrl);

  /// Create a copy of MixStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MixStatsImplCopyWith<_$MixStatsImpl> get copyWith =>
      __$$MixStatsImplCopyWithImpl<_$MixStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MixStatsImplToJson(
      this,
    );
  }
}

abstract class _MixStats extends MixStats {
  const factory _MixStats(
      {required final String uid,
      required final int power,
      required final String ownerUsername,
      required final String photoUrl}) = _$MixStatsImpl;
  const _MixStats._() : super._();

  factory _MixStats.fromJson(Map<String, dynamic> json) =
      _$MixStatsImpl.fromJson;

  @override
  String get uid;
  @override
  int get power;
  @override
  String get ownerUsername;
  @override
  String get photoUrl;

  /// Create a copy of MixStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MixStatsImplCopyWith<_$MixStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

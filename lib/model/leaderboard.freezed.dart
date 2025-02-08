// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Leaderboard _$LeaderboardFromJson(Map<String, dynamic> json) {
  return _Leaderboard.fromJson(json);
}

/// @nodoc
mixin _$Leaderboard {
  double get globalAverage => throw _privateConstructorUsedError;
  int get totalUser => throw _privateConstructorUsedError;
  double get userPercentile => throw _privateConstructorUsedError;
  int get userRank => throw _privateConstructorUsedError;
  double get userTotalPower => throw _privateConstructorUsedError;

  /// Serializes this Leaderboard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Leaderboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardCopyWith<Leaderboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardCopyWith<$Res> {
  factory $LeaderboardCopyWith(
          Leaderboard value, $Res Function(Leaderboard) then) =
      _$LeaderboardCopyWithImpl<$Res, Leaderboard>;
  @useResult
  $Res call(
      {double globalAverage,
      int totalUser,
      double userPercentile,
      int userRank,
      double userTotalPower});
}

/// @nodoc
class _$LeaderboardCopyWithImpl<$Res, $Val extends Leaderboard>
    implements $LeaderboardCopyWith<$Res> {
  _$LeaderboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Leaderboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? globalAverage = null,
    Object? totalUser = null,
    Object? userPercentile = null,
    Object? userRank = null,
    Object? userTotalPower = null,
  }) {
    return _then(_value.copyWith(
      globalAverage: null == globalAverage
          ? _value.globalAverage
          : globalAverage // ignore: cast_nullable_to_non_nullable
              as double,
      totalUser: null == totalUser
          ? _value.totalUser
          : totalUser // ignore: cast_nullable_to_non_nullable
              as int,
      userPercentile: null == userPercentile
          ? _value.userPercentile
          : userPercentile // ignore: cast_nullable_to_non_nullable
              as double,
      userRank: null == userRank
          ? _value.userRank
          : userRank // ignore: cast_nullable_to_non_nullable
              as int,
      userTotalPower: null == userTotalPower
          ? _value.userTotalPower
          : userTotalPower // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaderboardImplCopyWith<$Res>
    implements $LeaderboardCopyWith<$Res> {
  factory _$$LeaderboardImplCopyWith(
          _$LeaderboardImpl value, $Res Function(_$LeaderboardImpl) then) =
      __$$LeaderboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double globalAverage,
      int totalUser,
      double userPercentile,
      int userRank,
      double userTotalPower});
}

/// @nodoc
class __$$LeaderboardImplCopyWithImpl<$Res>
    extends _$LeaderboardCopyWithImpl<$Res, _$LeaderboardImpl>
    implements _$$LeaderboardImplCopyWith<$Res> {
  __$$LeaderboardImplCopyWithImpl(
      _$LeaderboardImpl _value, $Res Function(_$LeaderboardImpl) _then)
      : super(_value, _then);

  /// Create a copy of Leaderboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? globalAverage = null,
    Object? totalUser = null,
    Object? userPercentile = null,
    Object? userRank = null,
    Object? userTotalPower = null,
  }) {
    return _then(_$LeaderboardImpl(
      globalAverage: null == globalAverage
          ? _value.globalAverage
          : globalAverage // ignore: cast_nullable_to_non_nullable
              as double,
      totalUser: null == totalUser
          ? _value.totalUser
          : totalUser // ignore: cast_nullable_to_non_nullable
              as int,
      userPercentile: null == userPercentile
          ? _value.userPercentile
          : userPercentile // ignore: cast_nullable_to_non_nullable
              as double,
      userRank: null == userRank
          ? _value.userRank
          : userRank // ignore: cast_nullable_to_non_nullable
              as int,
      userTotalPower: null == userTotalPower
          ? _value.userTotalPower
          : userTotalPower // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaderboardImpl implements _Leaderboard {
  const _$LeaderboardImpl(
      {required this.globalAverage,
      required this.totalUser,
      required this.userPercentile,
      required this.userRank,
      required this.userTotalPower});

  factory _$LeaderboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaderboardImplFromJson(json);

  @override
  final double globalAverage;
  @override
  final int totalUser;
  @override
  final double userPercentile;
  @override
  final int userRank;
  @override
  final double userTotalPower;

  @override
  String toString() {
    return 'Leaderboard(globalAverage: $globalAverage, totalUser: $totalUser, userPercentile: $userPercentile, userRank: $userRank, userTotalPower: $userTotalPower)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardImpl &&
            (identical(other.globalAverage, globalAverage) ||
                other.globalAverage == globalAverage) &&
            (identical(other.totalUser, totalUser) ||
                other.totalUser == totalUser) &&
            (identical(other.userPercentile, userPercentile) ||
                other.userPercentile == userPercentile) &&
            (identical(other.userRank, userRank) ||
                other.userRank == userRank) &&
            (identical(other.userTotalPower, userTotalPower) ||
                other.userTotalPower == userTotalPower));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, globalAverage, totalUser,
      userPercentile, userRank, userTotalPower);

  /// Create a copy of Leaderboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardImplCopyWith<_$LeaderboardImpl> get copyWith =>
      __$$LeaderboardImplCopyWithImpl<_$LeaderboardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaderboardImplToJson(
      this,
    );
  }
}

abstract class _Leaderboard implements Leaderboard {
  const factory _Leaderboard(
      {required final double globalAverage,
      required final int totalUser,
      required final double userPercentile,
      required final int userRank,
      required final double userTotalPower}) = _$LeaderboardImpl;

  factory _Leaderboard.fromJson(Map<String, dynamic> json) =
      _$LeaderboardImpl.fromJson;

  @override
  double get globalAverage;
  @override
  int get totalUser;
  @override
  double get userPercentile;
  @override
  int get userRank;
  @override
  double get userTotalPower;

  /// Create a copy of Leaderboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardImplCopyWith<_$LeaderboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

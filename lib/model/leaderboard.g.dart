// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaderboardImpl _$$LeaderboardImplFromJson(Map<String, dynamic> json) =>
    _$LeaderboardImpl(
      globalAverage: (json['globalAverage'] as num).toDouble(),
      totalUser: (json['totalUser'] as num).toInt(),
      userPercentile: (json['userPercentile'] as num).toDouble(),
      userRank: (json['userRank'] as num).toInt(),
      userTotalPower: (json['userTotalPower'] as num).toDouble(),
    );

Map<String, dynamic> _$$LeaderboardImplToJson(_$LeaderboardImpl instance) =>
    <String, dynamic>{
      'globalAverage': instance.globalAverage,
      'totalUser': instance.totalUser,
      'userPercentile': instance.userPercentile,
      'userRank': instance.userRank,
      'userTotalPower': instance.userTotalPower,
    };

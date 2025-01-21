// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mix_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MixStatsImpl _$$MixStatsImplFromJson(Map<String, dynamic> json) =>
    _$MixStatsImpl(
      uid: json['uid'] as String,
      power: (json['power'] as num).toInt(),
      ownerUsername: json['ownerUsername'] as String,
      photoUrl: json['photoUrl'] as String,
    );

Map<String, dynamic> _$$MixStatsImplToJson(_$MixStatsImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'power': instance.power,
      'ownerUsername': instance.ownerUsername,
      'photoUrl': instance.photoUrl,
    };

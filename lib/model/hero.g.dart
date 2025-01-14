// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HeroImpl _$$HeroImplFromJson(Map<String, dynamic> json) => _$HeroImpl(
      name: json['name'] as String,
      level: (json['level'] as num).toInt(),
      currentExp: (json['currentExp'] as num).toInt(),
      expToLevel: (json['expToLevel'] as num).toInt(),
    );

Map<String, dynamic> _$$HeroImplToJson(_$HeroImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
      'currentExp': instance.currentExp,
      'expToLevel': instance.expToLevel,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatisticImpl _$$StatisticImplFromJson(Map<String, dynamic> json) =>
    _$StatisticImpl(
      label: json['label'] as String,
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$StatisticImplToJson(_$StatisticImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };

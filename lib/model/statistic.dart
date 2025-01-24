import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistic.freezed.dart';
part 'statistic.g.dart';

@freezed
class Statistic with _$Statistic {
  const factory Statistic({
    required String label,
    required double value,
    // int? runtime,
    // String? backdrop_path,
  }) = _Statistic;

  factory Statistic.fromJson(Map<String, dynamic> json) => _$StatisticFromJson(json);

  // This needs to be corrected
  static List<Statistic> fromJsonList(List<Map<String, dynamic>> json) =>
      json.map((d) => Statistic.fromJson(d)).toList();
}

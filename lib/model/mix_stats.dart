import 'package:freezed_annotation/freezed_annotation.dart';

part 'mix_stats.freezed.dart';
part 'mix_stats.g.dart';

@freezed
class MixStats with _$MixStats {
  const factory MixStats({
    int? power,
    // int? runtime,
    // String? backdrop_path,
  }) = _MixStats;

  factory MixStats.fromJson(Map<String, dynamic> json) => _$MixStatsFromJson(json);
}

// flutter packages pub run build_runner build --delete-conflicting-outputs
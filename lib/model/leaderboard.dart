import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard.freezed.dart';
part 'leaderboard.g.dart';

@freezed
class Leaderboard with _$Leaderboard {
  const factory Leaderboard({
    required double globalAverage,
    required int totalUser,
    required double userPercentile,
    required int userRank,
    required double userTotalPower,
    // int? runtime,
    // String? backdrop_path,
  }) = _Leaderboard;

  factory Leaderboard.fromJson(Map<String, dynamic> json) => _$LeaderboardFromJson(json);
}

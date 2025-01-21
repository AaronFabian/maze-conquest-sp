import 'package:maze_conquest_sp/model/mix_stats.dart';
import 'package:maze_conquest_sp/service/response/server_response.dart';

class LeaderboardResponse extends ServerResponse {
  late bool hasNextPage;
  late String lastUidCursor;
  late List<MixStats> leaderboard;

  @override
  Map<String, dynamic> get data => super.data;

  LeaderboardResponse(super.def) {
    hasNextPage = data["hasNextPage"];
    lastUidCursor = data["lastUidCursor"];

    // Even dynamic, implicit cast are not allowed in dart
    final leaderboard = data["leaderboard"] as List<dynamic>;
    this.leaderboard = leaderboard.map((item) => MixStats.fromJson(item)).toList();
  }
}

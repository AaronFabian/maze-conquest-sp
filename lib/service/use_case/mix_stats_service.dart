import 'dart:io';

import 'package:dio/dio.dart';
import 'package:maze_conquest_sp/helper/constant.dart';
import 'package:maze_conquest_sp/helper/error/handled_error.dart';
import 'package:maze_conquest_sp/helper/util.dart' as helper;
import 'package:maze_conquest_sp/model/mix_stats.dart';
import 'package:maze_conquest_sp/service/response/leaderboard_response.dart';
import 'package:maze_conquest_sp/service/response/server_response.dart';
import 'package:maze_conquest_sp/service/result.dart';
import 'package:maze_conquest_sp/service/service.dart';

class MixStatsService extends Service {
  MixStatsService(super.dio);

  Future<Result<MixStats>> getMixStats(String uid) async {
    try {
      final response = await dio.get<Map<String, dynamic>>("$apiUrl/mix_stats/$uid");
      if (response.data == null) throw Exception("Data not found; something gone wrong while fetching");

      final serverResponse = ServerResponse(response.data!);
      final mixStats = MixStats.fromJson(serverResponse.data);

      return Result(value: mixStats, error: null);
    } on DioException catch (e) {
      return helper.handleDioException(e);
    } catch (e) {
      if (e is SocketException) {
        logger.e(e.message);
        return Result(error: HandledError(e.message));
      }

      logger.f(e.toString());
      return Result(error: Exception("Fatal error occurred while fetching user->strongest hero"));
    }
  }

  Future<Result<LeaderboardResponse>> leaderboard(String? uidCursor) async {
    try {
      final response = await dio.post("$apiUrl/mix_stats/leaderboard", data: {"uidCursor": uidCursor});
      if (response.data == null) throw Exception("Data not found, something gone wrong while fetching leaderboard");

      // Here we want the LeaderboardResponse itself because it's unique, and already contain the MixStats we wants
      final leaderboardResponse = LeaderboardResponse(response.data);

      return Result(value: leaderboardResponse);
    } on DioException catch (e) {
      return helper.handleDioException(e);
      // throw Exception("Fatal crash, unexpected error while fetching leaderboard data; DioException");
    } on SocketException catch (e) {
      logger.e(e);
      return Result(error: Exception("Internal error"));
    } on Exception catch (e) {
      logger.f(e);
      return Result(error: e);
    }
  }
}

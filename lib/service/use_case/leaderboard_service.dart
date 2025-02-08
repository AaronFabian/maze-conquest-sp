import 'dart:io';

import 'package:dio/dio.dart';
import 'package:maze_conquest_sp/helper/constant.dart';
import 'package:maze_conquest_sp/helper/error/handled_error.dart';
import 'package:maze_conquest_sp/helper/util.dart' as helper;
import 'package:maze_conquest_sp/model/leaderboard.dart';
import 'package:maze_conquest_sp/service/response/server_response.dart';
import 'package:maze_conquest_sp/service/result.dart';
import 'package:maze_conquest_sp/service/service.dart';

class LeaderboardService extends Service {
  LeaderboardService(super.dio);

  Future<Result<Leaderboard>> getLeaderboard(String uid) async {
    try {
      final response = await dio.get<Map<String, dynamic>>("$apiUrl/statistics/users/leaderboard/$uid");
      if (response.data == null) throw Exception("Data not found; something gone wrong while fetching");

      final serverResponse = ServerResponse(response.data!);
      final mixStats = Leaderboard.fromJson(serverResponse.data);

      return Result(value: mixStats, error: null);
    } on DioException catch (e) {
      return helper.handleDioException(e);
    } on SocketException catch (e) {
      logger.e(e.message);
      return Result(error: HandledError(e.message));
    } catch (e) {
      logger.f(e.toString());
      return Result(error: Exception("Fatal error occurred while fetching user->strongest hero"));
    }
  }
}

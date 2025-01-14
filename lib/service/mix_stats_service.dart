import 'dart:io';

import 'package:dio/dio.dart';
import 'package:maze_conquest_sp/model/mix_stats.dart';
import 'package:maze_conquest_sp/service/constant.dart';
import 'package:maze_conquest_sp/service/server_response.dart';

class MixStatsService {
  static final _dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 5)));

  static Future<(MixStats?, Exception?)> getMixStats(String uid) async {
    try {
      final response = await _dio.get("$apiUrl/mix_stats/$uid");
      if (response.data == null) throw Exception("Data not found; something gone wrong while fetching");

      final serverResponse = ServerResponse(response.data as Map<String, dynamic>);
      final mixStats = MixStats.fromJson(serverResponse.data);

      return (mixStats, null);
    } catch (e) {
      print(e.toString());

      if (e is DioException) {
        print("DioException");
        return (null, e);
      }

      if (e is SocketException) {
        print("SocketException");
        return (null, e);
      }

      return (null, Exception("Fatal error occurred while fetching user->strongest hero"));
    }
  }
}

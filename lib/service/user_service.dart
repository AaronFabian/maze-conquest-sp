import 'dart:io';

import 'package:dio/dio.dart';
import 'package:maze_conquest_sp/model/hero.dart';
import 'package:maze_conquest_sp/model/world.dart';
import 'package:maze_conquest_sp/service/constant.dart';
import 'package:maze_conquest_sp/service/server_response.dart';

class UserService {
  static final _dio = Dio(BaseOptions(connectTimeout: const Duration(seconds: 5)));

  static Future<(Hero?, Exception?)> getUserStrongestHero(String uid) async {
    try {
      final response = await _dio.get("$apiUrl/users/$uid/strongest_hero");
      if (response.data == null) throw Exception("Data not found; something gone wrong while fetching");

      final serverResponse = ServerResponse(response.data as Map<String, dynamic>);
      final strongestHero = Hero.fromJson(serverResponse.data);

      return (strongestHero, null);
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

  static Future<World?> getUserMazeLevel(String uid) async {
    try {
      final response = await _dio.get("$apiUrl/users/$uid/maze_level");
      if (response.data == null) throw Exception("Data not found; something gone wrong while fetching");

      final serverResponse = ServerResponse(response.data);
      final maze = World.fromJson(serverResponse.data);

      return maze;
    } catch (e) {
      print(e.toString());
    }

    return null;
  }
}

import 'package:dio/dio.dart';
import 'package:maze_conquest_sp/helper/constant.dart';
import 'package:maze_conquest_sp/helper/util.dart' as helper;
import 'package:maze_conquest_sp/model/hero.dart';
import 'package:maze_conquest_sp/model/world.dart';
import 'package:maze_conquest_sp/service/response/server_response.dart';
import 'package:maze_conquest_sp/service/result.dart';
import 'package:maze_conquest_sp/service/service.dart';

class UserService extends Service {
  UserService(super.dio);

  Future<Result<Hero>> getUserStrongestHero(String uid) async {
    try {
      final response = await dio.get("$apiUrl/users/$uid/strongest_hero");
      if (response.data == null) throw Exception("Data not found; something gone wrong while fetching");

      final serverResponse = ServerResponse(response.data as Map<String, dynamic>);
      final strongestHero = Hero.fromJson(serverResponse.data);

      return Result(value: strongestHero);
    } on DioException catch (e) {
      return helper.handleDioException(e);
    } catch (e) {
      logger.f("Fatal error occurred while fetching user->strongest hero", error: e);
      return Result(error: Exception("Application crash"));
    }
  }

  Future<Result<World>> getUserMazeLevel(String uid) async {
    try {
      final response = await dio.get("$apiUrl/users/$uid/maze_level");
      if (response.data == null) throw Exception("Data not found; something gone wrong while fetching");

      final serverResponse = ServerResponse(response.data);
      final maze = World.fromJson(serverResponse.data);

      return Result(value: maze);
    } on DioException catch (e) {
      return helper.handleDioException(e);
    } catch (e) {
      logger.f("Fatal crash, unexpected error while user->maze level", error: e);
      return Result(error: Exception("Application crash"));
    }
  }
}

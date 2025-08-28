import 'package:dio/dio.dart';
import 'package:maze_conquest_sp/helper/constant.dart';
import 'package:maze_conquest_sp/helper/util.dart' as helper;
import 'package:maze_conquest_sp/model/statistic.dart';
import 'package:maze_conquest_sp/service/response/server_response.dart';
import 'package:maze_conquest_sp/service/result.dart';
import 'package:maze_conquest_sp/service/service.dart';

class StatisticService extends Service {
  StatisticService(super.dio);

  Future<Result<List<Statistic>>> getPercentileFromLevel(String uid) async {
    try {
      final response = await dio.get<Map<String, dynamic>>("$apiUrl/statistics/users/percentile_from_level/$uid");
      if (response.data == null) return Result(error: Exception("Data not found; something gone wrong while fetching"));

      final serverResponse = ServerResponse(response.data!);
      if (serverResponse.data is List) {
        final list = (serverResponse.data as List).map((e) => Map<String, dynamic>.from(e as Map)).toList();
        final statisticList = Statistic.fromJsonList(list);
        return Result(value: statisticList);
      } else {
        throw Exception("Unexpected data format: Expected a list");
      }
    } on DioException catch (e) {
      return helper.handleDioException(e);
    } catch (e) {
      logger.f("Fatal error occurred while fetching statistic->percentile from level", error: e);
      return Result(error: Exception("Application crash"));
    }
  }

  Future<Result<List<Statistic>>> getPercentileFromPower(String uid) async {
    try {
      final response = await dio.get<Map<String, dynamic>>("$apiUrl/statistics/users/percentile_from_power/$uid");
      if (response.data == null) return Result(error: Exception("Data not found; something gone wrong while fetching"));

      final serverResponse = ServerResponse(response.data!);
      if (serverResponse.data is List) {
        final list = (serverResponse.data as List).map((e) => Map<String, dynamic>.from(e as Map)).toList();
        final statisticList = Statistic.fromJsonList(list);
        return Result(value: statisticList);
      } else {
        throw Exception("Unexpected data format: Expected a list");
      }
    } on DioException catch (e) {
      return helper.handleDioException(e);
    } catch (e) {
      logger.f("Fatal error occurred while fetching statistic->percentile from level", error: e);
      return Result(error: Exception("Application crash"));
    }
  }
}

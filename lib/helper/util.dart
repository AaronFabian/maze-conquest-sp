import 'package:dio/dio.dart';
import 'package:maze_conquest_sp/helper/error/handled_error.dart';
import 'package:maze_conquest_sp/service/result.dart';
import 'package:maze_conquest_sp/service/use_case/mix_stats_service.dart';

Result<T> handleDioException<T>(DioException e) {
  final response = e.response;
  if (response != null) {
    switch (response.statusCode) {
      case 500:
        return Result(error: HandledError("Sorry, something wrong with server"));
      case 422:
        return Result(error: HandledError("Application crash, while sending data to server"));
      case 405:
        return Result(error: HandledError("Internal error, method not allowed"));
      case 400:
        return Result(error: HandledError(response.data["message"]));
      default:
        logger.f("Fatal crash, unhandled response error while fetching leaderboard data; DioException", error: e);
        return Result(error: HandledError("Application crash"));
    }
  }

  // If the error doesn't contain a response, handle other types of Dio errors (e.g., timeouts, connection errors)
  if (e.type == DioExceptionType.connectionTimeout) {
    logger.e("Connection Timeout Error: Unable to connect to the server");
    return Result(error: HandledError("Connection Timeout Error: Unable to connect to the server"));
  } else if (e.type == DioExceptionType.receiveTimeout) {
    logger.e("Receive Timeout Error: Server response too slow");
    return Result(error: HandledError("Receive Timeout Error: Server response too slow"));
  } else if (e.type == DioExceptionType.unknown) {
    logger.e("Network Error: No internet connection");
    return Result(error: HandledError("Network Error: No internet connection"));
  }

  logger.f("Fatal crash, unexpected error from DioException", error: e);
  return Result(error: HandledError("Application crash"));
}

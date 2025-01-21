import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

abstract class Service {
  final Dio dio;
  final Logger logger = Logger();

  Service(this.dio);
}

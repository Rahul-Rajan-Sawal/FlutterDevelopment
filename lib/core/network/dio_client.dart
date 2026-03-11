import 'package:dio/dio.dart';

class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.plain,
      headers: {"Content-Type": "application/json"},
    ),
  );

  static Dio get instance => _dio;
}

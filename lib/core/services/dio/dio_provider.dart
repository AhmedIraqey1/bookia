import 'package:bookia/core/services/dio/apis.dart';
import 'package:dio/dio.dart';

abstract class DioProvider {
  static late final Dio dio;
  static void init() {
    dio = Dio(BaseOptions(baseUrl: Apis.baseUrl));
  }

  static Future<Response> post(
    String register, {
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.post(
      endpoint,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  static Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.get(
      endpoint,
      data: headers,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  static Future<Response> put(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.put(
      endpoint,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  static Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.delete(
      endpoint,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }

  static Future<Response> patch(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
  }) async {
    return await dio.patch(
      endpoint,
      data: data,
      queryParameters: query,
      options: Options(headers: headers),
    );
  }
}

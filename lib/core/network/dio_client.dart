import 'package:dio/dio.dart';
import 'package:my_clean_code_template/core/const/api_const.dart';
import 'auth_interceptor.dart';
import 'api_exception.dart';

class DioClient {
  final Dio _dio;

  DioClient(AuthInterceptor authInterceptor)
    : _dio = Dio(
        BaseOptions(
          baseUrl: ApiConstant.baseUrl,
          connectTimeout: ApiConstant.connectTimeout,
          receiveTimeout: ApiConstant.receiveTimeout,
          headers: const {'Accept': 'application/json'},
        ),
      ) {
    _dio.interceptors.add(authInterceptor);
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  Future<Response> put(String path, {dynamic data}) async {
    try {
      return await _dio.put(path, data: data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  // DELETE
  Future<Response> delete(String path, {dynamic data}) async {
    try {
      return await _dio.delete(path, data: data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}

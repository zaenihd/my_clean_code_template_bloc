import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException({required this.message, this.statusCode});

  @override
  String toString() => message;

  factory ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiException(message: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return ApiException(message: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        return ApiException(message: 'Receive timeout');
      case DioExceptionType.badResponse:
        return ApiException(
          message: error.response?.data['message'] ?? 'Server error',
          statusCode: error.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return ApiException(message: 'Request cancelled');
      case DioExceptionType.unknown:
      default:
        return ApiException(message: 'No internet connection');
    }
  }
}

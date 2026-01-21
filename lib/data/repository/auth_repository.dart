import 'package:my_clean_code_template/core/di/service_locator.dart';
import 'package:my_clean_code_template/core/network/dio_client.dart';
import 'package:my_clean_code_template/data/model/login_model.dart';

class AuthRepository {
  final dioClient = sl<DioClient>();

  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    final response = await dioClient.post(
      '/login',
      queryParameters: {"email": email, "password": password},
    );
    final data = loginModelFromJson(response.toString());
    return data;
  }
}

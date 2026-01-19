import 'package:my_clean_code_template/core/network/dio_client.dart';
import 'package:my_clean_code_template/data/model/login_model.dart';
import 'package:my_clean_code_template/data/model/profile_model.dart';

class AuthRepository {
  final dioClient = DioClient();

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

  Future<dynamic> getProfile(String token) async {
    final dioClientWithToken = DioClient(token: token);
    final response = await dioClientWithToken.get('/profile');
    final data = profileModelFromJson(response.toString());
    return data.data;
  }
}

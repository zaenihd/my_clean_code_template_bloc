import 'package:dio/dio.dart';
import 'package:my_clean_code_template/core/network/api_exception.dart';
import 'package:my_clean_code_template/core/network/dio_client.dart';
import 'package:my_clean_code_template/data/model/profile_model.dart';
import 'package:my_clean_code_template/data/storage/app_shared.dart';

// class ProfileRepository {
//   final dioClient = sl<DioClient>();

//   Future<ProfileData> getProfile() async {
//   try {
//     final response = await dioClient.get('/profile');

//     print('ini response === ${response.data['code']}');

//     final data = ProfileModel.fromJson(response.data);

//     if (data.data == null) {
//       throw ApiException(message: response.data['message'], statusCode: response.data['code']);
//     }

//     return data.data!;
//   } on DioException catch (e) {
//     throw ApiException.fromDioError(e);
//   }
// }

// }


class ProfileRepository {
  final DioClient dioClient;
  final AppPreferences prefs;

  ProfileRepository(this.dioClient, this.prefs);

  Future<ProfileData> getProfile() async {
    try {
      final response = await dioClient.get('/profile');
      final model = ProfileModel.fromJson(response.data);

      if (model.data == null) {
        throw ApiException(
          message: model.message,
          statusCode: model.code,
        );
      }

      // Simpan cache DI REPOSITORY
      await prefs.saveProfile(model.data!);

      return model.data!;
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  ProfileData? getProfileFromCache() {
    return prefs.profile;
  }
}

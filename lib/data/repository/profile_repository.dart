import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_clean_code_template/core/network/api_exception.dart';
import 'package:my_clean_code_template/core/network/dio_client.dart';
import 'package:my_clean_code_template/data/model/profile_model.dart';
import 'package:my_clean_code_template/data/storage/app_shared.dart';

class ProfileRepository {
  final DioClient dioClient;
  final AppPreferences prefs;

  ProfileRepository(this.dioClient, this.prefs);

  Future<ProfileData> getProfile() async {
    try {
      final response = await dioClient.get('/profile');
      final model = ProfileModel.fromJson(response.data);

      if (model.data == null) {
        throw ApiException(message: model.message, statusCode: model.code);
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

  Future<void> uploadPhoto(File file, String userId) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
        "user_id": userId,
      });

      await dioClient.post('/upload-profile', data: formData);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}

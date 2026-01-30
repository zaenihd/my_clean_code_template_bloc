import 'package:my_clean_code_template/data/model/profile_model.dart';
import 'package:my_clean_code_template/data/repository/profile_repository.dart';

class ProfileUsecase {
  final ProfileRepository repo;

  ProfileUsecase({required this.repo});
  Future<ProfileData> fetchProfile() async {
    return await repo.getProfile();
  }

  ProfileData? fetchProfileChaced() {
    return repo.getProfileFromCache();
  }
}

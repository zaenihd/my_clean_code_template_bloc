import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_clean_code_template/core/di/service_locator.dart';
import 'package:my_clean_code_template/core/network/api_exception.dart';
import 'package:my_clean_code_template/core/usecase/profile_usecase.dart';
import 'package:my_clean_code_template/core/widget/app_notifier.dart';
import 'package:my_clean_code_template/data/model/profile_model.dart';
import 'package:my_clean_code_template/data/repository/profile_repository.dart';
import 'package:my_clean_code_template/data/storage/app_shared.dart';

part 'profile_state.dart';

// class ProfileCubit extends Cubit<ProfileState> {
//   ProfileCubit() : super(ProfileState());

//   final data = sl<AppPreferences>().profile;

//   final profileRepository = ProfileRepository();

//   Future<void> getProfile() async {
//     emit(state.copyWith(isLoading: true));
//     try {
//       // sl<AppPreferences>().saveProfile(profileData);
//       // if (data == null) {
//         final ProfileData profileData = await profileRepository.getProfile();
//         sl<AppPreferences>().saveProfile(profileData);
//       //   emit(state.copyWith(profileData: profileData));
//       // } else {
//       //   emit(state.copyWith(profileData: data));
//       // }
//       emit(state.copyWith(isLoading: false));
//     } on ApiException catch (e) {
//       emit(state.copyWith(isLoading: false));
//       if (e.statusCode == 401) {
//         AppNotifier.showError(e.message);
//       }
//       emit(state.copyWith(errorMessage: e.message));
//     } catch (e) {
//       emit(state.copyWith(isLoading: false));
//       emit(state.copyWith(errorMessage: e.toString()));
//     }

//     void getProfileFromLocal() {
//       ProfileData profile = sl<AppPreferences>().profile!;
//       emit(state.copyWith(profileData: profile));
//     }

//     // emit(ProfileUnauthenticated());

//     // emit(ProfileAuthenticated(profileData: profileData));
//   }
// }

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUsecase usecase;

  ProfileCubit(this.usecase) : super(ProfileState());

  Future<void> loadProfile() async {
    emit(state.copyWith(isLoading: true));

    // 1️⃣ tampilkan cache dulu (kalau ada)
    final cached = usecase.fetchProfileChaced();
    if (cached != null) {
      emit(state.copyWith(profileData: cached));
    }

    // 2️⃣ fetch dari API
    try {
      final profile = await usecase.fetchProfile();
      emit(state.copyWith(profileData: profile, isLoading: false));
    } on ApiException catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.message));
    }
  }
}

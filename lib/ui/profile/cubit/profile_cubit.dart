import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_clean_code_template/core/di/service_locator.dart';
import 'package:my_clean_code_template/data/model/profile_model.dart';
import 'package:my_clean_code_template/data/storage/app_shared.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  final data = sl<AppPreferences>().profile;

  Future<void> getProfile()async {
    print("hahahaha. =====>> " +data.toString());
    // emit(ProfileUnauthenticated());

    // emit(ProfileAuthenticated(profileData: profileData));

  }
}

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:image_picker/image_picker.dart';

import 'package:my_clean_code_template/core/network/api_exception.dart';
import 'package:my_clean_code_template/core/usecase/profile_usecase.dart';
import 'package:my_clean_code_template/core/widget/app_notifier.dart';
import 'package:my_clean_code_template/data/model/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUsecase usecase;

  ProfileCubit(this.usecase) : super(ProfileState());
  final ImagePicker _picker = ImagePicker();

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

  // void updateProfileFoto(BuildContext context) async {
  //   final cached = usecase.fetchProfileChaced();
  //   usecase.pickerFilesImage(context: context, userId: cached!.id.toString());
  // }

  Future<File?> takePhotoProfile(ImageSource source, String userId) async {
    final XFile? image = await _picker.pickImage(source: source);

    final File file = File(image!.path);
    final filesProfile = File(image.path);

    await usecase.postFoto(filesProfile, userId);
    loadProfile();

    AppNotifier.showSuccess("Berhasil mengubah foto profile");

    return file;
  }
}

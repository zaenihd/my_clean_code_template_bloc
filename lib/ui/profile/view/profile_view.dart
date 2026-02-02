import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_clean_code_template/core/widget/app_txt.dart';

import 'package:my_clean_code_template/ui/profile/cubit/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.profileData != null) {
            return Padding(
              padding: .symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: [
                  Txt("Profile", fontSize: 40, fontWeight: FontWeight.bold),
                  const SizedBox(height: 20.0),
                  Image.network(state.profileData!.client[0].image),
                  const SizedBox(height: 20.0),
                  ListTile(
                    // leading: Image.network(state.profileData!.client[0].image),
                    title: Txt(state.profileData!.name),
                    subtitle: Txt(state.profileData!.email),
                  ),
                  const SizedBox(height: 30.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        pickerFilesImage(
                          context: context,
                          userId: state.profileData!.id.toString(),
                        );
                      },
                      child: Text("Ganti foto Profil"),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state.errorMessage != null) {
            return Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(state.errorMessage!),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  void pickerFilesImage({
    required BuildContext context,
    required String userId,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Photo"),
              onTap: () async {
                Navigator.pop(context);
                context.read<ProfileCubit>().takePhotoProfile(
                  ImageSource.gallery,
                  userId,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                context.read<ProfileCubit>().takePhotoProfile(
                  ImageSource.camera,
                  userId,
                );
              },
            ),
          ],
        );
      },
    );
  }
}

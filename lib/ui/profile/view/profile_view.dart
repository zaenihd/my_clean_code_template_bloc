import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  ListTile(
                    leading: Image.network(state.profileData!.client[0].image),
                    title: Txt(state.profileData!.name),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<ProfileCubit>().loadProfile();
                },
                child: Text(state.errorMessage!),
              ),
            )
                ],
              ),
            );
          }
          if (state.errorMessage != null) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<ProfileCubit>().loadProfile();
                },
                child: Text(state.errorMessage!),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

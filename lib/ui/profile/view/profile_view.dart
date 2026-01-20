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
          return Column(
            children: [
              Txt("Profile", fontSize: 40, fontWeight: FontWeight.bold),
              const SizedBox(height: 20.0),
              // ListTile(
              //   leading: Image.network(profileData.client[0].image),
              //   title: Txt(profileData.name),
              // ),
            ],
          );
        },
      ),
    );
  }
}

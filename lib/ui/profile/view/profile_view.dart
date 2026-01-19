import 'package:flutter/material.dart';
import 'package:my_clean_code_template/core/widget/app_txt.dart';
import 'package:my_clean_code_template/data/model/profile_model.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key, required this.profileData});

  ProfileData profileData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Txt("Profile", fontSize: 40, fontWeight: FontWeight.bold),
          const SizedBox(height: 20.0),
          ListTile(
            leading: Image.network(profileData.client[0].image),
            title: Txt(profileData.name),
          ),
        ],
      ),
    );
  }
}

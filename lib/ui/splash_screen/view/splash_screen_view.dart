import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_code_template/core/di/service_locator.dart';
import 'package:my_clean_code_template/core/navigation/app_routes.dart';
import 'package:my_clean_code_template/core/navigation/navigation_service.dart';
import 'package:my_clean_code_template/core/widget/app_txt.dart';
import 'package:my_clean_code_template/data/storage/app_shared.dart';
import 'package:my_clean_code_template/ui/auth/login/bloc/login_bloc.dart';
import 'package:my_clean_code_template/ui/splash_screen/cubit/splash_cubit.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[200],
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashAuthenticated) {
            NavigationService.pushReplacementNamed(AppRoutes.profile);
          }
          if (state is SplashUnauthenticated) {
            NavigationService.pushReplacementNamed(AppRoutes.login);
          }
        },
        child: Center(
          child: Txt(
            "Ini Splash Screen",
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

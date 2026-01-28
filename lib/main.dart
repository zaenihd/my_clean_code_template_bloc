import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_code_template/core/di/service_locator.dart';
import 'package:my_clean_code_template/core/navigation/app_router.dart';
import 'package:my_clean_code_template/core/navigation/app_routes.dart';
import 'package:my_clean_code_template/core/navigation/navigation_service.dart';
import 'package:my_clean_code_template/ui/auth/login/bloc/login_bloc.dart';
import 'package:my_clean_code_template/ui/auth/login/view/login_view.dart';
import 'package:my_clean_code_template/ui/home/bloc/home_bloc.dart';
import 'package:my_clean_code_template/ui/ktp_scan/cubit/ktp_cubit.dart';
import 'package:my_clean_code_template/ui/main/view/main_view.dart';
import 'package:my_clean_code_template/ui/profile/cubit/profile_cubit.dart';
import 'package:my_clean_code_template/ui/splash_screen/cubit/splash_cubit.dart';
import 'package:my_clean_code_template/ui/splash_screen/view/splash_screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<SplashCubit>()..checkSession()),
        BlocProvider(create: (context) => sl<ProfileCubit>()..loadProfile()),
        BlocProvider(create: (context) => sl<LoginBloc>()),
        BlocProvider(create: (context) => sl<HomeBloc>()..add(FetchLowongan())),
        BlocProvider(create: (context) => sl<KtpCubit>()),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: SplashScreenView(),
      ),
    );
  }
}

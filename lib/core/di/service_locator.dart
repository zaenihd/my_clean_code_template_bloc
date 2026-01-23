import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_clean_code_template/core/network/auth_interceptor.dart';
import 'package:my_clean_code_template/core/network/dio_client.dart';
import 'package:my_clean_code_template/data/repository/home_repository.dart';
import 'package:my_clean_code_template/data/repository/profile_repository.dart';
import 'package:my_clean_code_template/data/storage/app_shared.dart';
import 'package:my_clean_code_template/ui/home/bloc/home_bloc.dart';
import 'package:my_clean_code_template/ui/profile/cubit/profile_cubit.dart';
import 'package:my_clean_code_template/ui/splash_screen/cubit/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // ======================
  // External
  // ======================
  final prefs = await SharedPreferences.getInstance();

  // ======================
  // Core
  // ======================
  sl.registerLazySingleton<AppPreferences>(() => AppPreferences(prefs));

  sl.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(sl()));

  sl.registerLazySingleton<DioClient>(() => DioClient(sl()));

  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl<ProfileRepository>()));

  sl.registerLazySingleton<SplashCubit>(() => SplashCubit(sl()));

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(sl<DioClient>(), sl<AppPreferences>()),
  );

  homeRegister();

  // ======================
  // Repository
  // ======================
}

void homeRegister() {
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepository(sl<DioClient>()),
  );
  sl.registerLazySingleton<HomeBloc>(() => HomeBloc(sl<HomeRepository>()));
}

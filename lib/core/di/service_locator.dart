import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_clean_code_template/core/network/auth_interceptor.dart';
import 'package:my_clean_code_template/core/network/dio_client.dart';
import 'package:my_clean_code_template/core/usecase/detail_lowongan_usecase.dart';
import 'package:my_clean_code_template/core/usecase/profile_usecase.dart';
import 'package:my_clean_code_template/data/repository/auth_repository.dart';
import 'package:my_clean_code_template/data/repository/detail_lowongan_repository.dart';
import 'package:my_clean_code_template/data/repository/home_repository.dart';
import 'package:my_clean_code_template/data/repository/profile_repository.dart';
import 'package:my_clean_code_template/data/storage/app_shared.dart';
import 'package:my_clean_code_template/ui/auth/login/bloc/login_bloc.dart';
import 'package:my_clean_code_template/ui/detail_lowongan/cubit/detail_lowongan_cubit.dart';
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
  // CORE
  sl.registerLazySingleton<DioClient>(() => DioClient(sl()));
  sl.registerLazySingleton<AppPreferences>(() => AppPreferences(prefs));
  sl.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(sl()));
  sl.registerLazySingleton<SplashCubit>(
    () => SplashCubit(sl(), sl<AuthRepository>()),
  );
  // ======================

  homeRegister();
  authRegister();
  detailLowonganInit();

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

void authRegister() {
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl<ProfileUsecase>()));

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(sl<DioClient>(), sl<AppPreferences>()),
  );
  sl.registerLazySingleton<ProfileUsecase>(
    () => ProfileUsecase(repo: sl<ProfileRepository>()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepository(dioClient: sl<DioClient>()),
  );
  sl.registerLazySingleton<LoginBloc>(() => LoginBloc(sl<AuthRepository>()));
}

void detailLowonganInit() {
  sl.registerLazySingleton<DetailLowonganRepository>(
    () => DetailLowonganRepository(dioClient: sl<DioClient>()),
  );
  sl.registerLazySingleton<DetailLowonganUsecase>(
    () => DetailLowonganUsecase(repo: sl<DetailLowonganRepository>()),
  );
  sl.registerFactory<DetailLowonganCubit>(
    () => DetailLowonganCubit(sl<DetailLowonganUsecase>()),
  );
}

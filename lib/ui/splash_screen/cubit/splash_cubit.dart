import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_clean_code_template/core/di/service_locator.dart';
import 'package:my_clean_code_template/data/model/login_model.dart';
import 'package:my_clean_code_template/data/repository/auth_repository.dart';
import 'package:my_clean_code_template/data/storage/app_shared.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AppPreferences prefs;
  final AuthRepository authRepository;

  SplashCubit(this.prefs, this.authRepository) : super(SplashInitial());

  Future<void> checkSession() async {
    await Future.delayed(const Duration(seconds: 2)); // animasi splash

    final token = prefs.token;

    if (token.isNotEmpty) {
      try {
        final LoginModel responseLogin = await authRepository.login(
          email: prefs.email,
          password: prefs.password,
        );
        sl<AppPreferences>().saveLoginData(
          token: responseLogin.token,
          email: prefs.email,
          password: prefs.password,
        );
      } catch (e) {
        print(e.toString());
      }
      emit(SplashAuthenticated());
    } else {
      emit(SplashUnauthenticated());
    }
  }
}

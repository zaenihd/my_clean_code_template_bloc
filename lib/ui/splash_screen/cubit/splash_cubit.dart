import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_clean_code_template/core/di/service_locator.dart';
import 'package:my_clean_code_template/data/storage/app_shared.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AppPreferences prefs;

  SplashCubit(this.prefs) : super(SplashInitial());

  Future<void> checkSession() async {
    await Future.delayed(const Duration(seconds: 2)); // animasi splash

    final token = prefs.token;

    if (token.isNotEmpty) {
      emit(SplashAuthenticated());
    } else {
      emit(SplashUnauthenticated());
    }
  }
}

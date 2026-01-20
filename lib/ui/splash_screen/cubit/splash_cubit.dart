

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_clean_code_template/core/di/service_locator.dart';
import 'package:my_clean_code_template/data/storage/app_shared.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  String? token = sl<AppPreferences>().token;

  Future<void> checkSession() async {
    await Future.delayed(Duration(seconds: 3));
    print(token.toString());
    if (token == null || token == "") {
      emit(SplashUnauthenticated());
    } else {
      emit(SplashAuthenticated());
    }
  }
}

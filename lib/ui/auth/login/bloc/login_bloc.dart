import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_clean_code_template/core/di/service_locator.dart';
import 'package:my_clean_code_template/core/navigation/app_routes.dart';
import 'package:my_clean_code_template/core/navigation/navigation_service.dart';
import 'package:my_clean_code_template/core/network/api_exception.dart';
import 'package:my_clean_code_template/core/widget/app_notifier.dart';
import 'package:my_clean_code_template/data/model/login_model.dart';
import 'package:my_clean_code_template/data/model/profile_model.dart';
import 'package:my_clean_code_template/data/repository/auth_repository.dart';
import 'package:my_clean_code_template/data/storage/app_shared.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final authRepository = AuthRepository();

  LoginBloc() : super(LoginState()) {
    on<LoginUserEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final LoginModel responseLogin = await authRepository.login(
          email: event.email,
          password: event.password,
        );
        emit(state.copyWith(dataLogin: responseLogin.data));
        emit(state.copyWith(isLoading: false));
        sl<AppPreferences>().saveToken(token: responseLogin.token);
        NavigationService.pushReplacementNamed(AppRoutes.profile);
      } on ApiException catch (e) {
        emit(state.copyWith(isLoading: false));
        AppNotifier.showError("${e.statusCode} : ${e.message}");
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        AppNotifier.showError("aaaas".toString());

        print(e.toString());
      }

      // TODO: implement event handler
    });
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  bool isLoading;
  LoginData? dataLogin;
  ProfileData? profileData;
  String? errorMessage;
  LoginState({this.isLoading = false, this.dataLogin, this.errorMessage, this.profileData});

  @override
  List<Object?> get props => [isLoading, dataLogin, errorMessage, profileData];

  LoginState copyWith({
    bool? isLoading,
    LoginData? dataLogin,
    String? errorMessage,
    ProfileData? profileData,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      dataLogin: dataLogin ?? this.dataLogin,
      errorMessage: errorMessage ?? this.errorMessage,
      profileData: profileData ?? this.profileData,
    );
  }
}

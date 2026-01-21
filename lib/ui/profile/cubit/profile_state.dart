// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.profileData,
    this.isLoading = false,
    this.errorMessage,
  });
  final ProfileData? profileData;
  final bool isLoading;
  final String? errorMessage;

  @override
  List<Object?> get props => [profileData, isLoading, errorMessage];

  ProfileState copyWith({
    ProfileData? profileData,
    bool? isLoading,
    String? errorMessage,
  }) {
    return ProfileState(
      profileData: profileData ?? this.profileData,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.profileData,
    this.isLoading = false,
    this.isLoadingUpload = false,
    this.errorMessage,
  });
  final ProfileData? profileData;
  final bool isLoading;
  final bool isLoadingUpload;
  final String? errorMessage;

  @override
  List<Object?> get props => [
    profileData,
    isLoading,
    errorMessage,
    isLoadingUpload,
  ];

  ProfileState copyWith({
    ProfileData? profileData,
    bool? isLoading,
    bool? isLoadingUpload,
    String? errorMessage,
  }) {
    return ProfileState(
      profileData: profileData ?? this.profileData,
      isLoading: isLoading ?? this.isLoading,
      isLoadingUpload: isLoadingUpload ?? this.isLoadingUpload,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

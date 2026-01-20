part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class ProfileAuthenticated extends ProfileState {
  final ProfileData profileData;

  const ProfileAuthenticated({required this.profileData});

  @override
  List<Object> get props => [profileData];
}

class ProfileUnauthenticated extends ProfileState {}

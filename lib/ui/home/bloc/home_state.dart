// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState extends Equatable {
  List<Lowongan>? lowongan;
  String? error;
  bool isLoading;
  HomeState({this.lowongan, this.error, this.isLoading = false});

  @override
  List<Object?> get props => [lowongan, error, isLoading];

  HomeState copyWith({
    List<Lowongan>? lowongan,
    String? error,
    bool? isLoading,
  }) {
    return HomeState(
      lowongan: lowongan ?? this.lowongan,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

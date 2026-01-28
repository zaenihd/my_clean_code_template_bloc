// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_lowongan_cubit.dart';

class DetailLowonganState extends Equatable {
  String? error;
  bool isLoading;
  DataDetailLowongan? dataLowongan;
  DetailLowonganState({this.error, this.isLoading = false, this.dataLowongan});

  @override
  List<Object?> get props => [error, isLoading, dataLowongan];

  DetailLowonganState copyWith({
    String? error,
    bool? isLoading,
    DataDetailLowongan? dataLowongan,
  }) {
    return DetailLowonganState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      dataLowongan: dataLowongan ?? this.dataLowongan,
    );
  }
}

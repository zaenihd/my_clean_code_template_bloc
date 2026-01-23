import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_clean_code_template/core/network/api_exception.dart';
import 'package:my_clean_code_template/data/model/lowongan_model.dart';
import 'package:my_clean_code_template/data/repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;
  HomeBloc(this.repository) : super(HomeState()) {
    on<FetchLowongan>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final List<Lowongan> request = await repository.getLowongan();
        emit(state.copyWith(isLoading: false, lowongan: request));
      } on ApiException catch (e) {
        emit(state.copyWith(isLoading: false, error: e.message));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });
  }
}

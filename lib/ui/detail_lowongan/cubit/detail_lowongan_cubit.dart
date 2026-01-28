import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_clean_code_template/core/usecase/detail_lowongan_usecase.dart';
import 'package:my_clean_code_template/core/widget/app_notifier.dart';
import 'package:my_clean_code_template/data/model/detail_lowongan_model.dart';
import 'package:my_clean_code_template/data/model/lowongan_model.dart';

part 'detail_lowongan_state.dart';

class DetailLowonganCubit extends Cubit<DetailLowonganState> {
  final DetailLowonganUsecase usecase;
  DetailLowonganCubit(this.usecase) : super(DetailLowonganState());

  Future<dynamic> fetchDetailLowongan(int id) async {
    emit(state.copyWith(isLoading: true));
    try {
      final DataDetailLowongan response = await usecase.execute(id);
      emit(state.copyWith(isLoading: false, dataLowongan: response));
    } catch (e) {
      AppNotifier.showError("$e".toString());
      print("hahahahahhaha ============>" + e.toString());
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}

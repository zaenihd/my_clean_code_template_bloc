import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_code_template/core/usecase/scan_ktp_usecase.dart';
import 'ktp_state.dart';

class KtpCubit extends Cubit<KtpState> {
  final ScanKtpUseCase scanKtpUseCase;

  KtpCubit(this.scanKtpUseCase) : super(KtpInitial());

  Future<void> scanKtp() async {
    emit(KtpLoading());

    try {
      final result = await scanKtpUseCase();
      emit(KtpLoaded(result));
    } catch (_) {
      emit(KtpError('Gagal scan KTP'));
    }
  }
}

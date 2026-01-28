

import 'package:my_clean_code_template/data/model/ktp_model.dart';
import 'package:my_clean_code_template/data/repository/ktp_repository.dart';

class ScanKtpUseCase {
  final KtpRepository repository;

  ScanKtpUseCase(this.repository);

  Future<KtpModel> call() {
    return repository.scanKtp();
  }
}

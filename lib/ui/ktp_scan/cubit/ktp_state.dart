import 'package:my_clean_code_template/data/model/ktp_model.dart';


sealed class KtpState {}

class KtpInitial extends KtpState {}

class KtpLoading extends KtpState {}

class KtpLoaded extends KtpState {
  final KtpModel data;
  KtpLoaded(this.data);
}

class KtpError extends KtpState {
  final String message;
  KtpError(this.message);
}

import 'package:dio/dio.dart';
import 'package:my_clean_code_template/core/navigation/app_routes.dart';
import 'package:my_clean_code_template/core/navigation/navigation_service.dart';
import 'package:my_clean_code_template/core/widget/app_notifier.dart';
import 'package:my_clean_code_template/data/storage/app_shared.dart';

class AuthInterceptor extends Interceptor {
  final AppPreferences prefs;

  AuthInterceptor(this.prefs);

  bool _isShowingDialog = false;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = prefs.token;

    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Cegah popup & navigation dobel
      if (!_isShowingDialog) {
        _isShowingDialog = true;

        await prefs.clearToken();

        // Tampilkan popup
        AppNotifier.showErrorDialog(
          title: 'Sesi Berakhir',
          message: 'Sesi kamu telah berakhir, silakan login kembali.',
        );

        // Delay dikit supaya dialog kelihatan
        Future.delayed(const Duration(milliseconds: 300), () {
          NavigationService.pushReplacementNamed(AppRoutes.login);
          _isShowingDialog = false;
        });
      }
    }

    // Tetap lempar error (optional)
    handler.next(err);
  }
}

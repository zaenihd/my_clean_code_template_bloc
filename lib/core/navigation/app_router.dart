import 'package:flutter/material.dart';
import 'package:my_clean_code_template/data/model/profile_model.dart';
import 'package:my_clean_code_template/ui/auth/login/view/login_view.dart';
import 'package:my_clean_code_template/ui/home/view/home_view.dart';
import 'package:my_clean_code_template/ui/profile/view/profile_view.dart';
import 'package:my_clean_code_template/ui/splash_screen/view/splash_screen_view.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginView());

      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (_) =>
              ProfileView(),
        );
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreenView());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) =>
          const Scaffold(body: Center(child: Text('Page not found'))),
    );
  }
}

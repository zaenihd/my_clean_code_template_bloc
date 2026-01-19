import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_code_template/core/navigation/app_router.dart';
import 'package:my_clean_code_template/core/navigation/navigation_service.dart';
import 'package:my_clean_code_template/ui/auth/login/bloc/login_bloc.dart';
import 'package:my_clean_code_template/ui/auth/login/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LoginBloc())],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: LoginView(),
      ),
    );
  }
}

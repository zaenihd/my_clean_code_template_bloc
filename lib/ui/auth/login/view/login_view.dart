import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_code_template/core/widget/app_solid_button.dart';
import 'package:my_clean_code_template/core/widget/app_text_form_field.dart';
import 'package:my_clean_code_template/core/widget/app_txt.dart';
import 'package:my_clean_code_template/ui/auth/login/bloc/login_bloc.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController(text: "hilman6262@gmail.com");
  final TextEditingController passwordController = TextEditingController(text: "Zezen123@");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .center,
              children: [
                Txt(
                  "ini adalah login",
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 20.0),
                AppTextFormField(
                  controller: emailController,
                  hintText: "Email",
                ),
                const SizedBox(height: 10.0),
                AppTextFormField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 10.0),
                AppSolidButton(
                  text:
                  state.isLoading == true ? "Loading..." :
                   "Login",
                  onPressed: () {
                    context.read<LoginBloc>().add(
                      LoginUserEvent(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

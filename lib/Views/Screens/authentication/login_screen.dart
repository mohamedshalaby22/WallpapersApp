import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import 'package:wallpapers_app/Views/AppWidgets/app_button.dart';
import 'package:flutter/material.dart';
import '../../AppWidgets/special_appbar.dart';
import 'widgets/login_screen_all_text_form_fields.dart';
import 'widgets/have_an_account_text.dart';
import 'widgets/login_screen_forgot_password_text.dart';
import 'widgets/login_screen_social_buttons.dart';
import 'widgets/special_started_text.dart';
import 'widgets/or_continue_social_text.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SpecialAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.height,
                specialStartedText(
                    title: 'Let\'s Sign You In',
                    subtitle: 'Welcome back, You\'ve been missed'),
                const LoginScreenAllTextFormFields(),
                5.height,
                const LoginScreenForgotPasswordText(),
                25.height,
                AppButton(text: 'Login', onTap: () async {}),
                55.height,
                orContinueWithSocialText(),
                30.height,
                const LoginScreenSocialButtons(),
                30.height,
                haveAnAccountText(
                    title: 'Don\'t Have An Account?',
                    subtitle: 'Sign Up',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const RegisterScreen()));
                    }),
                30.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

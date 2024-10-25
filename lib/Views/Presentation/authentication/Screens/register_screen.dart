import 'package:flutter/material.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import 'package:wallpapers_app/Views/AppWidgets/app_button.dart';
import 'login_screen.dart';
import '../widgets/register_screen_all_text_form_fields.dart';
import '../widgets/have_an_account_text.dart';
import '../widgets/special_started_text.dart';
import '../widgets/or_continue_social_text.dart';
import '../widgets/register_screen_social_buttons.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                25.height,
                specialStartedText(
                    title: 'Getting Started',
                    subtitle: 'Create an account to continue!'),
                const RegisterScreenAllTextFormFields(),
                AppButton(text: 'Register', onTap: () async {}),
                55.height,
                orContinueWithSocialText(),
                30.height,
                const RegisterScreenSocialButtons(),
                30.height,
                haveAnAccountText(
                    title: 'Already Have An Account?',
                    subtitle: 'Sign In',
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
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

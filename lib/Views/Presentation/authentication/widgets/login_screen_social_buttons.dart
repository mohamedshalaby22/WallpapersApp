import 'package:flutter/material.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import '../../../AppWidgets/app_social_button.dart';

class LoginScreenSocialButtons extends StatelessWidget {
  const LoginScreenSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppSocialButton(
          imagePath: 'facebook-logo',
          buttonText: 'Sign In With Facebook',
          isShowPadding: true,
          onTap: () {},
        ),
        20.height,
        AppSocialButton(
          imagePath: 'google-logo',
          buttonText: 'Sign In With Google',
          buttonColor: Colors.transparent,
          buttonTextColor: Colors.black,
          onTap: () {},
        ),
      ],
    );
  }
}

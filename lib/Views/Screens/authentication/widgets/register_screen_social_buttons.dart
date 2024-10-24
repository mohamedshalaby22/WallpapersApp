import 'package:flutter/material.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import '../../../AppWidgets/app_social_button.dart';

class RegisterScreenSocialButtons extends StatelessWidget {
  const RegisterScreenSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: AppSocialButton(
          imagePath: 'facebook-logo',
          buttonText: 'Facebook',

          onTap: () {},
        )),
        20.width,
        Expanded(
            child: AppSocialButton(
          imagePath: 'google-logo',
          buttonText: 'Google',
          buttonColor: Colors.transparent,
          buttonTextColor: Colors.black,
          onTap: () {},
        )),
      ],
    );
  }
}

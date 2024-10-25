import '../../../../Constants/constants_colors.dart';
import '../../../AppWidgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginScreenForgotPasswordText extends StatelessWidget {
  const LoginScreenForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: const SizedBox(
        width: double.infinity,
        child: AppText(
          text: 'Forgot Your Password ?',
          textAlign: TextAlign.end,
          fontSize: 13,
          color: ConstantsColors.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';

import '../../../AppWidgets/app_text_form_field.dart';

class LoginScreenAllTextFormFields extends StatelessWidget {
  const LoginScreenAllTextFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField(
          hintText: 'Enter your email',
          formController: TextEditingController(),
        ),
        AppTextFormField(
          hintText: 'Enter your password',
          formController: TextEditingController(),
          isShowSuffixIcon: true,
        ),
        15.height,
      ],
    );
  }
}

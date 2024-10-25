import 'package:flutter/cupertino.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';

import '../../../AppWidgets/app_text_form_field.dart';

class RegisterScreenAllTextFormFields extends StatelessWidget {
  const RegisterScreenAllTextFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField(
          hintText: 'Username',
          formController: TextEditingController(),
        ),
        AppTextFormField(
          hintText: 'Email',
          formController: TextEditingController(),
        ),
        AppTextFormField(
          hintText: 'Password',
          formController: TextEditingController(),
        ),
        AppTextFormField(
          hintText: 'Confirm password',
          formController: TextEditingController(),
        ),
        15.height,
      ],
    );
  }
}

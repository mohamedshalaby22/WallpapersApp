import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import '../../../../Controllers/auth/login_controller.dart';
import '../../../../Helpers/Services/app_services.dart';
import '../../../AppWidgets/app_text_form_field.dart';

class LoginScreenAllTextFormFields extends StatelessWidget {
  const LoginScreenAllTextFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(
        builder: (context, data, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextFormField(
                  hintText: 'Enter your email',
                  formController: data.emailController,
                  type: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!AppServices.emailRegX.hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                AppTextFormField(
                  hintText: 'Enter your password',
                  formController: data.passwordController,
                  isShowSuffixIcon: true,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                15.height,
              ],
            ));
  }
}

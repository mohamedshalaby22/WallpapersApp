import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/Controllers/auth/register_controller.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import 'package:wallpapers_app/Helpers/Services/app_services.dart';
import '../../../AppWidgets/app_text_form_field.dart';

class RegisterScreenAllTextFormFields extends StatelessWidget {
  const RegisterScreenAllTextFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterController>(
        builder: (context, data, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextFormField(
                  hintText: 'Firstname',
                  formController: data.firstnameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'First name is required';
                    }
                    return null;
                  },
                ),
                AppTextFormField(
                  hintText: 'Lastname',
                  formController: data.lastnameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Last name is required';
                    }
                    return null;
                  },
                ),
                AppTextFormField(
                  hintText: 'Email',
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
                  hintText: 'Phone',
                  type: TextInputType.phone,
                  formController: data.phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    }

                    return null;
                  },
                ),
                AppTextFormField(
                  hintText: 'Password',
                  formController: data.passwordController,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                AppTextFormField(
                  hintText: 'Confirm password',
                  formController: data.confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    if (data.passwordController.text !=
                        data.confirmPasswordController.text) {
                      return 'Password didn\'t match ';
                    }
                    return null;
                  },
                ),
                15.height,
              ],
            ));
  }
}

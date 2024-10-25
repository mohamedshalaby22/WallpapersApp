
import 'package:flutter/material.dart';
import '../../Constants/constants_colors.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField({
    super.key,
    required this.hintText,
    required this.formController,
    required this.validator,
    this.isShowSuffixIcon = false,
    this.onChange,
    this.type = TextInputType.text,
  });
  final String hintText;
  final TextEditingController formController;
  final bool isShowSuffixIcon;
  bool isShowPassword = false;
  final FormFieldValidator validator;
  final TextInputType type;
  final Function(String value)? onChange;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, StateSetter setState) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextFormField(
                controller: formController,
                validator: validator,
                onChanged: (value) {
                  if(onChange!=null){
                  onChange!(value);

                  }
                },
                cursorColor: ConstantsColors.primaryColor,
                keyboardType: type,
                style: const TextStyle(color: Colors.black87),
                obscureText: isShowSuffixIcon ? !isShowPassword : false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 20, vertical: 8),
                  fillColor: Colors.grey[50],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 1.2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 1.2)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1.2)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1.2)),
                  suffixIcon: Visibility(
                    visible: isShowSuffixIcon,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      child: Visibility(
                          visible: isShowPassword,
                          replacement: const Icon(Icons.remove_red_eye_outlined,
                              color: Colors.grey),
                          child: const Icon(Icons.visibility_off_outlined,
                              color: Colors.grey)),
                    ),
                  ),
                  hintText: hintText,
                  hintStyle:
                      const TextStyle(color: Color(0xff8e9ba9), fontSize: 14),
                ),
              ),
            ));
  }
}

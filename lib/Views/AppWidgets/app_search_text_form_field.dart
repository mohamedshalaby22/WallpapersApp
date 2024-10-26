import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ep.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import '../../Constants/constants_colors.dart';

class AppSearchTextFormField extends StatelessWidget {
  AppSearchTextFormField({
    super.key,
    required this.hintText,
    required this.formController,
    required this.onChange,
    this.isShowSuffixIcon = false,
    this.isActive = false,
  });
  final String hintText;
  final TextEditingController formController;
  final bool isShowSuffixIcon, isActive;
  bool isShowPassword = false;
  final Function(String value) onChange;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, StateSetter setState) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isActive ? ConstantsColors.primaryColor : Colors.grey,
                width: 1.3)),
        child: Row(
          children: [
            Iconify(Ep.search,
                color: isActive ? Colors.black87 : Colors.black54),
            10.width,
            Expanded(
              child: TextFormField(
                onChanged: (value) {
                  onChange(value);
                },
                cursorColor: ConstantsColors.primaryColor,
                style: const TextStyle(color: Colors.black54),
                decoration: const InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    border: InputBorder.none),
              ),
            ),
            10.width,
            Container(
              width: 1,
              height: 20,
              color: Colors.grey,
            ),
            10.width,
            Iconify(Mdi.tune_variant,
                color: isActive ? Colors.black87 : Colors.black54),
          ],
        ),
      ),
    );
  }
}

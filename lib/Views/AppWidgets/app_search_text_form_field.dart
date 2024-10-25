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
    this.isShowSuffixIcon = false,
  });
  final String hintText;
  final TextEditingController formController;
  final bool isShowSuffixIcon;
  bool isShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, StateSetter setState) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey, width: 1.3)),
              child: Row(
                children: [
                  const Iconify(Ep.search, color: Colors.black54),
                  10.width,
                  Expanded(
                    child: TextFormField(
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
                  Iconify(Mdi.tune_variant, color: Colors.black54),
                ],
              ),
            ));
  }
}

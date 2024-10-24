import 'package:flutter/material.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';

import '../../../../Constants/constants_colors.dart';
import '../../../AppWidgets/app_text.dart';

Widget haveAnAccountText(
        {required String title,
        required String subtitle,
        required Function onTap}) =>
    GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: title,
            fontWeight: FontWeight.w600,
          ),
          5.width,
          AppText(
            text: subtitle,
            fontWeight: FontWeight.w600,
            color: ConstantsColors.primaryColor,
          ),
        ],
      ),
    );

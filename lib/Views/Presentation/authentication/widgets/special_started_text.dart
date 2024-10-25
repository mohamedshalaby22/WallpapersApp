import 'package:flutter/material.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';

import '../../../AppWidgets/app_text.dart';

Widget specialStartedText({required String title, required String subtitle}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: title,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        10.height,
        AppText(
          text: subtitle,
          maxLines: 2,
          height: 1.2,
          color: Colors.grey,
        ),
        24.height,
      ],
    );

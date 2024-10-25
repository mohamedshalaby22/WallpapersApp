import 'package:flutter/material.dart';
import '../../Helpers/Services/app_services.dart';
import 'app_text.dart';

class SnackBarWidget {
  static showSnackBarWidget(
      {required String message, Color backColor = Colors.green}) {
    ScaffoldMessenger.of(AppServices.navigatorKey.currentState!.context)
        .showSnackBar(SnackBar(
        backgroundColor: backColor,
        behavior: SnackBarBehavior.floating,
        content: AppText(
          text: message,
          color: Colors.white,
          maxLines: 5,
        )));
  }
}

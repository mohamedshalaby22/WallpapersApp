import 'package:flutter/material.dart';

class AppServices {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final emailRegX = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
}

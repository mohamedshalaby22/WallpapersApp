import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'Views/Presentation/my_app/my_app_screen.dart';
import 'firebase_options.dart';

void main() async {
  //v3QxWJrOCRzfkdcJfd3ngfuffE6rUDGOW2H9X2bYFT1QXSR5Zpfb1dNQ
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyAppScreen());
}

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wallpapers_app/Helpers/Services/app_services.dart';
import 'package:wallpapers_app/Helpers/Services/shared_references.dart';
import 'Views/Presentation/my_app/my_app_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  AppServices.isLoggedIn = await SharedPreferencesStorage.getIsLoggedIn();
  await dotenv.load();
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  runApp(const MyAppScreen());
  FlutterNativeSplash.remove();
}

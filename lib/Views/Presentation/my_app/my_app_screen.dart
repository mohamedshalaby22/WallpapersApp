import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpapers_app/Controllers/app_layout_controller.dart';
import 'package:wallpapers_app/Controllers/auth/register_controller.dart';
import 'package:wallpapers_app/Helpers/Services/app_services.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/Views/Presentation/authentication/Screens/register_screen.dart';
import 'package:wallpapers_app/Views/Presentation/my_app/app_layout_screen.dart';
import '../../../Controllers/auth/login_controller.dart';
import '../../../Controllers/home/home_controller.dart';
import '../../../Controllers/home/wallpaper_details_controller.dart';
import '../../../Controllers/search/search_controller.dart';

class MyAppScreen extends StatelessWidget {
  const MyAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => AppLayoutController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(create: (context) => SearchScreenController()),
        ChangeNotifierProvider(
            create: (context) => WallpaperDetailsController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppServices.navigatorKey,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
        ),
        home: AppServices.isLoggedIn
            ? const AppLayoutScreen()
            : const RegisterScreen(),
      ),
    );
  }
}

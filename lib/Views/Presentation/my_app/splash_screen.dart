import 'package:flutter/material.dart';
import 'package:wallpapers_app/Constants/constants_paths.dart';
import 'package:wallpapers_app/Views/Presentation/authentication/Screens/register_screen.dart';
import 'package:wallpapers_app/Views/Presentation/home/Screens/home_screen.dart';
import 'package:wallpapers_app/Views/Presentation/my_app/app_layout_screen.dart';

import '../../../Helpers/Services/shared_references.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkIfUserIsLoggedIn();
    super.initState();
  }

  bool isLoggedIn = false;
  void checkIfUserIsLoggedIn() async {
    isLoggedIn = await SharedPreferencesStorage.getIsLoggedIn();
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      if (isLoggedIn) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AppLayoutScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const RegisterScreen()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              curve: Curves.easeInOut,
              duration: const Duration(seconds: 3),
              tween: Tween<double>(
                begin: 10,
                end: size.width * 0.80,
              ),
              builder: (
                BuildContext context,
                dynamic value,
                child,
              ) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        '${ConstantsPaths.imagePath}splash-logo.png',
                        width: value,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

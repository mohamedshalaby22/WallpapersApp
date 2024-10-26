import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import 'package:wallpapers_app/Helpers/Services/shared_references.dart';
import 'package:wallpapers_app/Views/Presentation/authentication/Screens/register_screen.dart';
import '../../../../Constants/constants_colors.dart';
import '../../../AppWidgets/app_text.dart';

class SettingsScreenLogoutDialog extends StatelessWidget {
  const SettingsScreenLogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AppText(
          text: 'Are You Sure To Want Logout!',
          color: Colors.red,
          fontSize: 16,
        ),
        10.height,
        const AppText(
          maxLines: 3,
          text:
              'You Are Also Logged out from your cloud and any local app data',
          textAlign: TextAlign.center,
          height: 1.3,
        ),
        15.height,
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red, width: 1.3),
                  ),
                  child: const Center(
                    child: AppText(
                      text: 'Cancel',
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
            10.width,
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  await SharedPreferencesStorage.setIsLoggedIn(false);
                  await SharedPreferencesStorage.clearPref();
                  if (context.mounted) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.transparent, width: 1.3),
                      color: ConstantsColors.primaryColor),
                  child: const Center(
                    child: AppText(
                      text: 'Logout',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'widgets/settings_screen_logout_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => const AlertDialog.adaptive(
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    content: SettingsScreenLogoutDialog(),
                  ));
        },
        child: const Center(
            child: Icon(
          Icons.logout,
          color: Colors.red,
          size: 100,
        )),
      ),
    );
  }
}

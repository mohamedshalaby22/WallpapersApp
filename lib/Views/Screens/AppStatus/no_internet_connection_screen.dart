import 'package:flutter/material.dart';
import 'package:wallpapers_app/Constants/constants_paths.dart';
import '../../AppWidgets/app_button.dart';
import '../authentication/widgets/special_started_text.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  const NoInternetConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: specialStartedText(
                    title: 'No Internet Connection',
                    subtitle:
                        'Its look like you\'re not connected to the internet'),
              ),
              Center(
                child: Image.asset(
                  '${ConstantsPaths.imagePath}no-internet.png',
                  width: 300,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: AppButton(text: 'Try Again...', onTap: () async {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

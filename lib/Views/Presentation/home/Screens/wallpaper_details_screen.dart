import 'package:flutter/material.dart';
import 'package:wallpapers_app/Views/AppWidgets/app_button.dart';
import '../widgets/wallpaper_details_screen_action_buttons.dart';
import '../widgets/wallpaper_details_screen_appbar.dart';

class WallpaperDetailsScreen extends StatelessWidget {
  const WallpaperDetailsScreen({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(image))),
          ),
          WallpaperDetailsScreenAppbar(),
          PositionedDirectional(
              top: MediaQuery.sizeOf(context).height / 2 + 170,
              end: 20,
              child: const WallpaperDetailsActionButtons()),
          Padding(
            padding: EdgeInsetsDirectional.only(
                top: MediaQuery.sizeOf(context).height - 100,
                start: 16,
                end: 16),
            child: Opacity(
              opacity: 0.7,
              child: AppButton(
                text: 'Apply',
                onTap: () async {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

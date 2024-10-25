import 'package:flutter/material.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import 'package:wallpapers_app/Views/Presentation/authentication/widgets/special_started_text.dart';
import '../widgets/favorite_screen_wallpaper_list.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            80.height,
            specialStartedText(
                title: 'Favorites',
                subtitle: 'You\'ve marked all of these as favorite!'),
            FavoriteScreenWallpapersList(),
          ],
        ),
      ),
    );
  }
}

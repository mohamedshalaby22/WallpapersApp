import 'package:flutter/material.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import '../widgets/home_screen_wallpapers_list.dart';
import '../widgets/home_screen_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeScreenAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            20.height,
            HomeScreenWallpapersList(),
          ],
        ),
      ),
    );
  }
}

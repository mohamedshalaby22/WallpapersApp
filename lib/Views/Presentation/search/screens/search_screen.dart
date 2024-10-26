import 'package:flutter/material.dart';
import '../widgets/search_screen_appbar.dart';
import '../widgets/search_screen_wallpaper_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const SearchScreenAppBar(),
        body: TabBarView(
          children: [
            SearchScreenWallpaperList(),
            Container(
              color: Colors.yellow[200],
            ),
            Container(
              color: Colors.green[200],
            ),
          ],
        ),
      ),
    );
  }
}

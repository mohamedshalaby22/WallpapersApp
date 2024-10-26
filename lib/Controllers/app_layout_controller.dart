import 'package:flutter/material.dart';
import 'package:wallpapers_app/Views/Presentation/home/Screens/home_screen.dart';
import 'package:wallpapers_app/Views/Presentation/search/screens/search_screen.dart';
import '../Views/Presentation/favorite/screens/favorite_screen.dart';
import '../Views/Presentation/settings/settings_screen.dart';

class AppLayoutController extends ChangeNotifier {
  List<Widget> screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const SearchScreen(),
    const SettingsScreen(),
  ];
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  void changeCurrentIndex({required int index}) {
    _currentIndex = index;
    notifyListeners();
  }
}

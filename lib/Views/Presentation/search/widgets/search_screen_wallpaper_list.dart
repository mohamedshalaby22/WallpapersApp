import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/Controllers/search/search_controller.dart';
import 'package:wallpapers_app/Views/AppWidgets/app_text.dart';
import 'package:wallpapers_app/Views/Presentation/home/widgets/home_screen_loading_widget.dart';
import 'package:wallpapers_app/Views/Presentation/home/widgets/special_image_widget.dart';
import '../../home/Screens/wallpaper_details_screen.dart';

class SearchScreenWallpaperList extends StatelessWidget {
  const SearchScreenWallpaperList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchScreenController>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Visibility(
          visible: value.isLoaded,
          replacement: const HomeScreenLoadingWidget(),
          child: MasonryGridView.builder(
            itemCount: value.data.length,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            itemBuilder: (context, index) {
              return SpecialImageWidget(
                imageUrl: value.data[index].src.large,
                canShowFavorite: false,
                onTap: () {},
              );
            },
          ),
        ),
      ),
    );
  }
}

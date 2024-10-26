import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/Controllers/home/home_controller.dart';
import 'package:wallpapers_app/Views/Presentation/home/widgets/home_screen_loading_widget.dart';
import 'package:wallpapers_app/Views/Presentation/home/widgets/special_image_widget.dart';
import '../Screens/wallpaper_details_screen.dart';

class HomeScreenWallpapersList extends StatefulWidget {
  const HomeScreenWallpapersList({super.key});

  @override
  State<HomeScreenWallpapersList> createState() =>
      _HomeScreenWallpapersListState();
}

class _HomeScreenWallpapersListState extends State<HomeScreenWallpapersList> {
  @override
  void initState() {
    Provider.of<HomeController>(context, listen: false).getHomeWallpapers();
    Provider.of<HomeController>(context, listen: false).loadFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, value, child) => Visibility(
        visible: value.isLoaded,
        replacement: const Expanded(
          child: HomeScreenLoadingWidget(),
        ),
        child: Expanded(
          child: MasonryGridView.builder(
            itemCount: value.data.length,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            itemBuilder: (context, index) {
              final itemId = value.data[index].id; // Get the item ID
              final isFavorite = value.favoriteIds.contains(itemId);
              return SpecialImageWidget(
                imageUrl: value.data[index].src.large,
                isPremium: index.isEven,
                isFavorite: isFavorite,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WallpaperDetailsScreen(
                            image: value.data[index].src.large,
                            imageId: value.data[index].id,
                          )));
                },
                onSelectFavorite: () {
                  value.toggleFavorite(
                      value.data[index].id, value.data[index].src.large);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

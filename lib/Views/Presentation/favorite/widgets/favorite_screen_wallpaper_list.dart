import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/Constants/constants_colors.dart';
import 'package:wallpapers_app/Views/Presentation/favorite/widgets/no_favorite_wallpaper_widget.dart';
import 'package:wallpapers_app/Views/Presentation/home/widgets/special_image_widget.dart';
import '../../../../Controllers/home/home_controller.dart';

class FavoriteScreenWallpapersList extends StatelessWidget {
  const FavoriteScreenWallpapersList({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context);
    return StreamBuilder(
        stream: provider.getFavoritesList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
                child: CupertinoActivityIndicator(
              color: ConstantsColors.primaryColor,
            ));
          }
          final favoriteList = snapshot.data!.docs;
          return Expanded(
            child: Visibility(
              visible: favoriteList.isNotEmpty,
              replacement: noFavoriteWallpaperWidget(),
              child: MasonryGridView.builder(
                itemCount: favoriteList.length,
                padding: EdgeInsets.zero,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                itemBuilder: (context, index) {
                  return SpecialImageWidget(
                    imageUrl: favoriteList[index]['url'],
                    isFavorite: true,
                    onTap: () {},
                    onSelectFavorite: () {
                      provider.favoritesRef
                          .doc(favoriteList[index]['id'])
                          .delete();
                    },
                  );
                },
              ),
            ),
          );
        });
  }
}

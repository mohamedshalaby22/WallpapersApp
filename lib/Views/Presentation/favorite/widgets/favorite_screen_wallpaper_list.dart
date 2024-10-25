import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpapers_app/Views/Presentation/home/widgets/special_image_widget.dart';

import 'no_favorite_wallpaper_widget.dart';

class FavoriteScreenWallpapersList extends StatelessWidget {
  FavoriteScreenWallpapersList({super.key});
  List<String> images = [
    'https://images.unsplash.com/photo-1728327511232-f387c138a097?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxOHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1729218620890-f120489dcd11?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1728574111706-20a21247ff4f?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: images.isNotEmpty,
      replacement: noFavoriteWallpaperWidget(),
      child: Expanded(
        child: MasonryGridView.builder(
          itemCount: images.length,
          padding: EdgeInsets.zero,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          itemBuilder: (context, index) {
            return SpecialImageWidget(
              imageUrl: images[index],
              isFavorite: true,
              onTap: () {},
              onSelectFavorite: () {},
            );
          },
        ),
      ),
    );
  }
}

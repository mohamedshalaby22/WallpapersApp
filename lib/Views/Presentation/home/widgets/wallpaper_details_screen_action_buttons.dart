import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/Controllers/home/wallpaper_details_controller.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import '../../../../Controllers/home/home_controller.dart';

class WallpaperDetailsActionButtons extends StatelessWidget {
  const WallpaperDetailsActionButtons(
      {super.key, required this.imageUrl, required this.imageId});
  final String imageUrl, imageId;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context);
    final isFavorite = provider.favoriteIds.contains(imageId);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            provider.toggleFavorite(imageId, imageUrl);
          },
          child: Visibility(
            visible: isFavorite,
            replacement: const Icon(
              Icons.favorite_border_rounded,
              color: Colors.white,
              size: 35,
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 35,
            ),
          ),
        ),
        20.height,
        Consumer<WallpaperDetailsController>(
          builder: (context, value, child) => GestureDetector(
            onTap: () async {
              await value.downloadImage(imageUrl);
            },
            child: const Iconify(
              AntDesign.cloud_download_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
        15.height,
        const Icon(
          Icons.more_horiz,
          color: Colors.white,
          size: 35,
        ),
      ],
    );
  }
}

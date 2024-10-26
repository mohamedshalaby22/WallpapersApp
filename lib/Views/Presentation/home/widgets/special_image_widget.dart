import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../Constants/constants_paths.dart';

class SpecialImageWidget extends StatelessWidget {
  SpecialImageWidget(
      {super.key,
      required this.imageUrl,
      required this.onTap,
      this.onSelectFavorite,
      this.isPremium = false,
      this.isFavorite = false,
      this.canShowFavorite = true});
  final String imageUrl;
  bool isPremium, isFavorite, canShowFavorite;
  final Function onTap;
  final Function? onSelectFavorite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          Visibility(
            visible: isPremium,
            child: PositionedDirectional(
              end: 15,
              top: 5,
              child: Image.asset(
                '${ConstantsPaths.imagePath}premium.png',
                width: 25,
              ),
            ),
          ),
          Visibility(
            visible: canShowFavorite,
            child: PositionedDirectional(
              end: 15,
              bottom: 5,
              child: GestureDetector(
                onTap: () {
                  if (onSelectFavorite != null) {
                    onSelectFavorite!();
                  }
                },
                child: Visibility(
                  visible: isFavorite,
                  replacement: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

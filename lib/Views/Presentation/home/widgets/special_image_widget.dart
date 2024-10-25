import 'dart:ffi';

import 'package:flutter/material.dart';
import '../../../../Constants/constants_paths.dart';

class SpecialImageWidget extends StatelessWidget {
  SpecialImageWidget(
      {super.key,
      required this.imageUrl,
      required this.onTap,
      this.onSelectFavorite,
      this.isPremium = false,
      this.isFavorite = false});
  final String imageUrl;
  bool isPremium, isFavorite;
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
            child: Image.network(
              imageUrl,
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
          PositionedDirectional(
            end: 15,
            bottom: 5,
            child: GestureDetector(
              onTap: () {
                onSelectFavorite!.call();
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
        ],
      ),
    );
  }
}

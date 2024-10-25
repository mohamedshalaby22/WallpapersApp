import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import '../../../../Constants/constants_colors.dart';
import '../../../../Constants/constants_paths.dart';
import '../../../AppWidgets/app_gradient_text.dart';
import 'package:flutter/material.dart';

Widget noFavoriteWallpaperWidget() => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          40.height,
          Image.asset('${ConstantsPaths.imagePath}empty-favorite.png'),
          10.height,
          const GradientText(
              text: 'Oops! no favorite to display',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              gradient: LinearGradient(colors: [
                ConstantsColors.primaryColor,
                Colors.deepOrange,
              ]))
        ],
      ),
    );

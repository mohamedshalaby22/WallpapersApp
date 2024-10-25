import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';

class WallpaperDetailsActionButtons extends StatelessWidget {
  const WallpaperDetailsActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.favorite_border_rounded,
          color: Colors.white,
          size: 35,
        ),
        20.height,
        const Iconify(
          AntDesign.cloud_download_outlined,
          color: Colors.white,
          size: 35,
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

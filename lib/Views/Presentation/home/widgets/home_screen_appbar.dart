import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:wallpapers_app/Constants/constants_paths.dart';
import 'package:iconify_flutter/icons/nimbus.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.grey.withOpacity(0.1),
      elevation: 3.0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.grey[500]!,
          ),
          Image.asset(
            '${ConstantsPaths.imagePath}splash-logo.png',
            width: 170,
          ),
          Iconify(
            Nimbus.notification,
            color: Colors.grey[500]!,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

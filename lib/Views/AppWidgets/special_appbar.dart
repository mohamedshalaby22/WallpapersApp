import 'package:flutter/material.dart';
import 'package:wallpapers_app/Views/AppWidgets/special_icon.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class SpecialAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SpecialAppBar({super.key, this.isShowSuffixAppbarIcon = false});
  final bool isShowSuffixAppbarIcon;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          specialIcon(
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Visibility(
            visible: isShowSuffixAppbarIcon,
            child: specialIcon(
              icon: Mdi.filter_menu_outline,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

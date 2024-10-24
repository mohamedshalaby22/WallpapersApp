import 'package:flutter/material.dart';

class SpecialAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SpecialAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Container(
            padding: const EdgeInsetsDirectional.all(7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[100],
            ),
            child: Icon(
              Icons.chevron_left,
              color: Colors.grey[600]!,
            )),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

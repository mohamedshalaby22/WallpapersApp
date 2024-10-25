import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:iconify_flutter/icons/majesticons.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:provider/provider.dart';
import 'package:wallpapers_app/Controllers/app_layout_controller.dart';

class AppLayoutScreen extends StatelessWidget {
  const AppLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context
          .read<AppLayoutController>()
          .screens[context.watch<AppLayoutController>().currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          elevation: 0.0,
          color: const Color(0xff2a303e),
          padding: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.only(top: 22),
            child: BottomNavigationBar(
              backgroundColor: const Color(0xff2a303e),
              currentIndex: context.watch<AppLayoutController>().currentIndex,
              onTap: (int index) {
                context
                    .read<AppLayoutController>()
                    .changeCurrentIndex(index: index);
              },
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Iconify(
                      Uil.home_alt,
                      color: Colors.white,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Iconify(
                      MaterialSymbols.favorite_outline,
                      color: Colors.white,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Iconify(
                      Ri.search_2_line,
                      color: Colors.white,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Iconify(
                      Majesticons.applications_line,
                      color: Colors.white,
                    ),
                    label: ''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

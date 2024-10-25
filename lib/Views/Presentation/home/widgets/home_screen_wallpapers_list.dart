import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpapers_app/Views/Presentation/home/widgets/special_image_widget.dart';
import '../Screens/wallpaper_details_screen.dart';

class HomeScreenWallpapersList extends StatelessWidget {
  HomeScreenWallpapersList({super.key});
  List<String> images = [
    'https://images.unsplash.com/photo-1727374703446-432a38041d0e?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1728327511232-f387c138a097?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxOHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1729218620890-f120489dcd11?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1728902293794-99df76c0b017?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyMnx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1728574111706-20a21247ff4f?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1729603453955-9dcde8c3e465?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwzNnx8fGVufDB8fHx8fA%3D%3D',
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MasonryGridView.builder(
        itemCount: images.length,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        itemBuilder: (context, index) {
          return SpecialImageWidget(
            imageUrl: images[index],
            isPremium: index.isEven,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      WallpaperDetailsScreen(image: images[index])));
            },
            onSelectFavorite: () {},
          );
        },
      ),
    );
  }
}

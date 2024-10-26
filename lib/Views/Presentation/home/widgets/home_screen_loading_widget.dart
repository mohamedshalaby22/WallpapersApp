import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../AppWidgets/loading_shimmer_effect.dart';

class HomeScreenLoadingWidget extends StatelessWidget {
  const HomeScreenLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: 10,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      itemBuilder: (context, index) {
        return const ShimmerEffectWidget(height: 260);
      },
    );
  }
}

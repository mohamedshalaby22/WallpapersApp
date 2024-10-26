import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffectWidget extends StatelessWidget {
  const ShimmerEffectWidget(
      {super.key,
      this.width = double.infinity,
      required this.height,
      this.radius = 15});
  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.07),
      highlightColor: Colors.grey.withOpacity(0.12),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: const Color(0xffFAFAFF),
          border: Border.all(color: const Color(0x056E757C)),
        ),
      ),
    );
  }
}

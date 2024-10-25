import 'package:flutter/material.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import '../../../AppWidgets/app_text.dart';
import '../../../AppWidgets/special_icon.dart';

class WallpaperDetailsScreenAppbar extends StatelessWidget {
  WallpaperDetailsScreenAppbar({super.key});
  bool isShowWallpaperInfo = false;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (context, StateSetter setState) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 70, start: 20),
                  child: specialIcon(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 70, end: 20),
                  child: Row(
                    children: [
                      Visibility(
                        visible: isShowWallpaperInfo,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isShowWallpaperInfo = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    const AppText(
                                      text: 'Uploaded: 19/07/2022',
                                      fontSize: 12,
                                    ),
                                    8.width,
                                    const Icon(
                                      Icons.close,
                                      color: Colors.grey,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            PositionedDirectional(
                              end: -10,
                              child: CustomPaint(
                                size:
                                    const Size(20, 30), // Adjust size as needed
                                painter: TrianglePainter(),
                              ),
                            )
                          ],
                        ),
                      ),
                      15.width,
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isShowWallpaperInfo = true;
                          });
                        },
                        child: const Icon(
                          Icons.info_outline_rounded,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the paint style
    final paint = Paint()
      ..color = Colors.grey[100]!
      ..style = PaintingStyle.fill; // Fill the triangle

    // Define the triangle points
    final path = Path()
      ..moveTo(0, size.height) // Bottom-left
      ..lineTo(size.width, size.height / 2) // Forward-right (tip)
      ..lineTo(0, 0) // Top-left
      ..close(); // Connect back to the start point

    // Draw the triangle
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

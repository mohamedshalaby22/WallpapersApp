import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';
import 'package:wallpapers_app/Helpers/Extensions/SizedBox.dart';
import '../../Constants/constants_paths.dart';
import 'package:flutter/material.dart';
import 'app_text.dart';

class AppSocialButton extends StatelessWidget {
  const AppSocialButton({
    super.key,
    required this.imagePath,
    required this.buttonText,
    required this.onTap,
    this.buttonColor = const Color(0xff3b82f6),
    this.buttonTextColor = Colors.white,
    this.isShowPadding = false,
  });
  final String imagePath, buttonText;
  final Function onTap;
  final Color buttonColor, buttonTextColor;
  final bool isShowPadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
            border: Border.all(
                color: buttonColor == Colors.transparent
                    ? Colors.grey[300]!
                    : Colors.transparent),
            color: buttonColor,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: buttonColor == Colors.transparent,
              replacement: Padding(
                padding: EdgeInsets.only(left: isShowPadding ? 15 : 0),
                child: const Iconify(
                  Gg.facebook,
                  color: Colors.white,
                ),
              ),
              child: Container(
                width: 25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            '${ConstantsPaths.imagePath}$imagePath.png'))),
              ),
            ),
            20.width,
            AppText(
              text: buttonText,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: buttonTextColor,
            )
          ],
        ),
      ),
    );
  }
}

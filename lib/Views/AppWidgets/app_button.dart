import 'package:flutter/material.dart';
import '../../Constants/constants_colors.dart';
import 'app_text.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final Future Function() onTap;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !isLoading
          ? () async {
              setState(() {
                isLoading = true;
              });
              await widget.onTap();
              setState(() {
                isLoading = false;
              });
            }
          : () {},
      child: Container(
          height: 56,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ConstantsColors.primaryColor,
          ),
          child: Center(
              child: Visibility(
            visible: !isLoading,
            replacement: const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.5,
              ),
            ),
            child: AppText(
              text: widget.text,
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ))),
    );
  }
}

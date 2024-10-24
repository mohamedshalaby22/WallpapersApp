
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w400,
    this.maxLines = 1,
    this.height = 1.0,
    this.textAlign =TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.overflow = TextOverflow.visible,
    this.fontSize = 14,
  });
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize, height;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          decoration: textDecoration,
          fontWeight: fontWeight,
          fontSize: fontSize,
          height: height),
    );
  }
}

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String label;
  final double fontSize;
  final Color? color; // ✅ Made nullable
  final FontWeight? fontWeight; // ✅ Made nullable

  const TextWidget({
    super.key,
    required this.label,
    this.fontSize = 18,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? Colors.white, // ✅ Fallback if null
        fontWeight: fontWeight ?? FontWeight.w500, // ✅ Fallback if null
      ),
    );
  }
}

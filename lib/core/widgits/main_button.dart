import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.color,
    this.textColor,
    this.borderColor,
  });
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color? color; // You can customize the color as needed
  final Color? textColor; // You can customize the text color as needed
  final Color? borderColor; // You can customize the border color as needed
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      child: Text(
        text,
        style: TextStyles.button.copyWith(color: textColor ?? Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, height ?? 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: color,
        side: BorderSide(color: borderColor ?? Colors.transparent),
      ),
    );
  }
}

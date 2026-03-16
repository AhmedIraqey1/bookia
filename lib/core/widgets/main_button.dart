import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.bgColor = AppColors.primaryColor,
    this.txColor = AppColors.accentColor,
    required this.text,
    this.width = double.infinity,
    this.height = 60,
    this.borderColor = AppColors.primaryColor,
    required this.onTap,
  });
  final Color bgColor;
  final Color txColor;
  final Color borderColor;
  final String text;
  final double width;
  final double height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: BoxBorder.all(color: borderColor),
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyles.caption1.copyWith(color: txColor),
          ),
        ),
      ),
    );
  }
}

import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  const BottomText({
    super.key, required this.text, required this.textButton, required this.onTap,
  });
  final String text;
  final String textButton;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
         text,
          style: TextStyles.caption1.copyWith(
            color: AppColors.darkColor,
          ),
        ),
        GestureDetector(
          onTap:onTap,
          child: Text(
            textButton,
            style: TextStyles.caption1.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

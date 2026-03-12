import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class HeadLineText extends StatelessWidget {
  const HeadLineText({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.headline,
    );
  }
}

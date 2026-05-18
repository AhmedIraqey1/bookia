import 'package:bookia/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle headline = TextStyle(
    fontFamily: AppFonts.dMSerifDisplay,
    fontSize: 30,
  );
  static const TextStyle title = TextStyle(
    fontFamily: AppFonts.dMSerifDisplay,
    fontSize: 24,
  );
  static const TextStyle subtitle = TextStyle(
    fontFamily: AppFonts.dMSerifDisplay,
    fontSize: 18,
  );
  static const TextStyle body = TextStyle(
    fontFamily: AppFonts.dMSerifDisplay,
    fontSize: 16,
  );
  static const TextStyle caption = TextStyle(
    fontFamily: AppFonts.dMSerifDisplay,
    fontSize: 14,
  );
  static const TextStyle captionB = TextStyle(
    fontFamily: AppFonts.dMSerifDisplay,
    fontSize: 18,
  );
  static const TextStyle button = TextStyle(
    fontFamily: AppFonts.dMSerifDisplay,
    fontSize: 16,
  );
}

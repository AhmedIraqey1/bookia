import 'package:bookia/core/constants/app_fonts.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static ThemeData get lightThemes => ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: AppFonts.dMSerifDisplay,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      onSurface: AppColors.dark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.whiteColor,
        textStyle: TextStyles.button,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.iconsColor.withOpacity(0.1),
      filled: true,
      hintStyle: TextStyles.body.copyWith(color: AppColors.iconsColor),
      // prefixIcon: Icon(Icons.email, color: AppColors.iconsColor),
      // suffixIcon: Icon(
      //   Icons.check_circle,
      //   color: AppColors.primary,
      // ),
      // suffixText: '@gmail.com',
      // suffixStyle: TextStyles.caption.copyWith(color: Colors.green),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.dark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.dark.withOpacity(0.1)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.iconsColor,
      selectedLabelStyle: TextStyles.button.copyWith(height: 2),
      unselectedLabelStyle: TextStyles.caption,

      elevation: 0,
    ),
    dividerColor: AppColors.accentColor,
  );
}

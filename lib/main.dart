import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/styles/theme.dart';
import 'package:bookia/features/intro/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  DioProvider.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightThemes,
      home: const SplashScreen(),
    );
  }
}

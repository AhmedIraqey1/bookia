import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navgations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      pop(context);
                    },
                    child: SvgPicture.asset(AppImages.backSvg),
                  ),
                ],
              ),
              Gap(30),
              Text(
                'Welcome back! Glad to see you, Again!',
                style: TextStyles.headline,
              ),
              Gap(30),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  fillColor: AppColors.borderColor,
                  filled: true,
                  focusColor: AppColors.primaryColor,
                 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}

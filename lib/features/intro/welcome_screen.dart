import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgits/main_button.dart';
import 'package:bookia/features/auth/presentation/screens/login_screen.dart';
import 'package:bookia/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.bg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            top: 0,
            left: 22,
            right: 22,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 2),
                SvgPicture.asset(AppIcons.bookia),
                Gap(10),

                Text(
                  'Order Your Book Now!',
                  style: TextStyles.subtitle.copyWith(color: AppColors.dark),
                ),
                Spacer(flex: 5),
                MainButton(
                  text: 'Login',
                  onPressed: () {
                    pushTo(context, LoginScreen());
                  },

                  height: 60,
                ),
                Gap(20),
                MainButton(
                  text: 'Sign Up',
                  onPressed: () {
                    pushTo(context, RegisterScreen());
                    // Navigate to the next screen
                  },

                  height: 60,
                  color: AppColors.whiteColor,
                  textColor: AppColors.dark,
                  borderColor: AppColors.dark,
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

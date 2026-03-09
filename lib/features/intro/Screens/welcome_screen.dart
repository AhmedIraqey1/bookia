import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navgations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/features/Auth/Login/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Image.asset(
              AppImages.bg,
              fit: BoxFit.cover,
              width: double.infinity,
            ),

            Positioned(
              bottom: 100,
              top: 150,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.logoSvg, width: 235),
                    SizedBox(height: 8),
                    Text('Order Your Book Now!', style: TextStyles.subtitle1),
                    Spacer(),
                    MainButton(
                      text: 'Login',
                      onTap: () {
                        pushTo(context, LoginScreen());
                      },
                    ),
                    Gap(10),
                    MainButton(
                      text: 'Register',
                      bgColor: AppColors.accentColor,
                      txColor: AppColors.darkColor,
                      borderColor: AppColors.darkColor,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgits/main_button.dart';
import 'package:bookia/core/widgits/my_padding.dart';
import 'package:bookia/core/widgits/my_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MySafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              pop(context);
            },
            child: SvgPicture.asset(AppIcons.back),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: MyPadding(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'OTP Verification',
                      style: TextStyles.headline.copyWith(fontSize: 35),
                    ),
                  ],
                ),
                Gap(15),
                Text(
                  'Enter the verification code we just sent on your email address.',

                  style: TextStyles.body.copyWith(color: AppColors.iconsColor),
                ),
                Gap(35),
                Pinput(
                  length: 6,
                  defaultPinTheme: PinTheme(
                    width: 50,
                    height: 60,
                    textStyle: TextStyles.headline.copyWith(fontSize: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Gap(35),
                MainButton(text: 'verify', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

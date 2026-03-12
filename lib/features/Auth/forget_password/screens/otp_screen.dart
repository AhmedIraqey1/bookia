import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navgations.dart';
import 'package:bookia/core/widgets/bottom_text.dart';
import 'package:bookia/core/widgets/head_line_text.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/my_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
            leadingWidth: 100,
            leading: GestureDetector(
              onTap: () {
                pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(4),
                child: SvgPicture.asset(AppImages.backSvg),
              ),
            ),
          ),
          body: Center(
          child: MyPadding(
            child: Column(
              children: [
                Gap(30),
                HeadLineText(text: 'OTP Verification'),
                Gap(15),
                Text(
                  'Enter the verification code we just sent on your email address.',
                ),
                Gap(30),
                
                Gap(30),
                MainButton(text: 'Verify', onTap: () {}),
                Spacer(),
                BottomText(
                  text: 'Didn’t received code? ',
                  textButton: 'Resend',
                  onTap: () {},
                ),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
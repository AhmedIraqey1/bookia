import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navgations.dart';
import 'package:bookia/core/widgets/bottom_text.dart';
import 'package:bookia/core/widgets/head_line_text.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/my_padding.dart';
import 'package:bookia/features/Auth/presentation/forget_password/screens/create_new_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

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

                Align(
                  alignment: Alignment.center,
                  child: Pinput(
                    length: 6,
                    defaultPinTheme: PinTheme(
                      padding: EdgeInsets.all(0),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(204, 231, 230, 230),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Gap(30),
                MainButton(
                  text: 'Verify',
                  onTap: () {
                    pushTo(context, CreateNewPassword());
                  },
                ),
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

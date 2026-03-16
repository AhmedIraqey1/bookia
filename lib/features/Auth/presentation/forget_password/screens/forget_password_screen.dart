import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navgations.dart';
import 'package:bookia/core/functions/validations.dart';
import 'package:bookia/core/widgets/bottom_text.dart';
import 'package:bookia/core/widgets/custom_form_feild.dart';
import 'package:bookia/core/widgets/head_line_text.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/my_padding.dart';
import 'package:bookia/features/Auth/presentation/forget_password/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final formkey = GlobalKey<FormState>();

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
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Gap(30),
                  HeadLineText(text: 'Forgot Password?'),
                  Gap(15),
                  Text(
                    'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                  ),
                  Gap(30),
                  CustomFormFeild(
                    hintText: "Enter your email",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "The field is empty";
                      }

                      // 2. التأكد من صحة صيغة الإيميل
                      if (!isEmailValid(value)) {
                        return "Not Accepted Email";
                      }

                      // 3. الحل: إرجاع null يعني أن الإدخال صحيح
                      return null;
                    },
                  ),
                  
                  Gap(30),
                  MainButton(
                    text: 'Send Code',
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        pushTo(context, OtpScreen());
                      }
                    },
                  ),
                  Spacer(),
                  BottomText(
                    text: 'Remember Password? ',
                    textButton: 'Login',
                    onTap: () {},
                  ),
                  Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

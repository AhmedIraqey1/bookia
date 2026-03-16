import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navgations.dart';
import 'package:bookia/core/functions/validations.dart';
import 'package:bookia/core/widgets/bottom_text.dart';
import 'package:bookia/core/widgets/custom_form_feild.dart';
import 'package:bookia/core/widgets/head_line_text.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/my_padding.dart';
import 'package:bookia/core/widgets/password_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(30),
                  HeadLineText(text: 'Hello! Register to get started'),
                  Gap(20),
                  CustomFormFeild(hintText: 'Username'),
                  Gap(15),
                  CustomFormFeild(
                    hintText: 'EMAIL',
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
                  Gap(15),
                  PasswordFormFeild(
                    hintText: 'Password',

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "The field is empty";
                      }

                      // 2. التأكد من صحة صيغة الإيميل
                      if (!isPasswordvalid(value)) {
                        return "Password must contain uppercase,\n lowercase, number and special character ";
                      }

                      // 3. الحل: إرجاع null يعني أن الإدخال صحيح
                      return null;
                    },
                  ),
                  Gap(15),
                  PasswordFormFeild(
                    hintText: 'Confirm password',

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "The field is empty";
                      }

                      // 2. التأكد من صحة صيغة الإيميل
                      if (!isPasswordvalid(value)) {
                        return "Password must contain uppercase,\nlowercase, number and special character ";
                      }

                      // 3. الحل: إرجاع null يعني أن الإدخال صحيح
                      return null;
                    },
                  ),
                  Gap(30),
                  MainButton(
                    text: 'Register',
                    onTap: () {
                      if (formkey.currentState!.validate()) {}
                    },
                  ),
                  Spacer(),
                  BottomText(
                    text: 'Already have an account? ',
                    textButton: 'Login Now',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

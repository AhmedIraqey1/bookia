import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navgations.dart';
import 'package:bookia/core/functions/validations.dart';
import 'package:bookia/core/widgets/bottom_text.dart';
import 'package:bookia/core/widgets/custom_form_feild.dart';
import 'package:bookia/core/widgets/head_line_text.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/my_padding.dart';
import 'package:bookia/core/widgets/password_form_feild.dart';
import 'package:bookia/features/Auth/presentation/forget_password/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(30),
                HeadLineText(text: 'Create new password'),
                Gap(15),
                Text(
                  'Your new password must be unique from those previously used.',
                ),
                Gap(30),
                Gap(15),
                PasswordFormFeild(
                  hintText: 'New Password',

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
                Gap(40),
                MainButton(
                  text: 'Reset Password',
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      pushTo(context, OtpScreen());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

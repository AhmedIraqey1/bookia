import 'dart:math';

import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navgations.dart';
import 'package:bookia/core/functions/validations.dart';
import 'package:bookia/core/widgets/bottom_text.dart';
import 'package:bookia/core/widgets/custom_form_feild.dart';
import 'package:bookia/core/widgets/head_line_text.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/my_padding.dart';
import 'package:bookia/core/widgets/password_form_feild.dart';
import 'package:bookia/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/Auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocProvider(
        create: (context) => AuthCubit(),
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
          body: RegisterBody(),
        ),
      ),
    );
  }
}

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          print('success');
        } else {
          print('error');
        }
      },
      builder: (context, state) {
        var cubit = context.read<AuthCubit>();
        return Center(
          child: MyPadding(
            child: Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Gap(30),
                    HeadLineText(text: 'Hello! Register to get started'),
                    Gap(20),
                    CustomFormFeild(
                      hintText: 'Username',
                      controller: cubit.usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "The field is empty";
                        }

                        // 3. الحل: إرجاع null يعني أن الإدخال صحيح
                        return null;
                      },
                    ),
                    Gap(15),
                    CustomFormFeild(
                      controller: cubit.emailController,
                      hintText: 'EMAIL',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "The field is empty";
                        }

                        // 2. التأكد من صحة صيغة الإيميل
                        if (!isEmailValid(value)) {
                          return "Not Accepted Email";
                        }

                        if (state is AuthErrorState) {
                          return "This Email AlReady used";
                        }

                        // 3. الحل: إرجاع null يعني أن الإدخال صحيح
                        return null;
                      },
                    ),
                    Gap(15),
                    PasswordFormFeild(
                      controller: cubit.passwordController,
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
                      controller: cubit.passwordConfirmationController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "The field is empty";
                        }

                        // 2. التأكد من صحة صيغة الإيميل
                        if (!isPasswordvalid(value)) {
                          return "Password must contain uppercase,\nlowercase, number and special character ";
                        }

                        if (value != cubit.passwordController.text) {
                          return "Passwords do not match";
                        }

                        // 3. الحل: إرجاع null يعني أن الإدخال صحيح
                        return null;
                      },
                    ),
                    Gap(30),
                    if (state is AuthLoadingState) ...{
                      CircularProgressIndicator(),
                    } else ...{
                      MainButton(
                        text: 'Register',
                        onTap: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.register();
                          }
                        },
                      ),
                    },
                    Gap(30),
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
        );
      },
    );
  }
}

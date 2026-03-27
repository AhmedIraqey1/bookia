import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/navgations.dart';
import 'package:bookia/core/functions/validations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgets/bottom_text.dart';
import 'package:bookia/core/widgets/custom_form_feild.dart';
import 'package:bookia/core/widgets/head_line_text.dart';
import 'package:bookia/core/widgets/main_button.dart';
import 'package:bookia/core/widgets/my_padding.dart';
import 'package:bookia/core/widgets/password_form_feild.dart';
import 'package:bookia/features/Auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/Auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/Auth/presentation/widgets/sign_in_with.dart';
import 'package:bookia/features/Auth/presentation/forget_password/screens/forget_password_screen.dart';
import 'package:bookia/features/Auth/presentation/registeration/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          body: LoginBody(),
        ),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = context.read<AuthCubit>();
        return Center(
          child: MyPadding(
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  Gap(30),
                  HeadLineText(
                    text: 'Welcome back! Glad to see you, Again!',
                  ),
                  Gap(30),
                  CustomFormFeild(
                    controller: cubit.emailController,
                    hintText: 'Enter your email',
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
                  Gap(20),
                  PasswordFormFeild(
                    hintText: 'Enter Your Password',
                    controller: cubit.passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "The field is empty";
                      }
    
                      // // 2. التأكد من صحة صيغة الإيميل
                      // if (!isEmailValid(value)) {
                      //   return "Not Accepted Email";
                      // }
    
                      // 3. الحل: إرجاع null يعني أن الإدخال صحيح
                      return null;
                    },
                  ),
    
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          pushTo(context, ForgetPasswordScreen());
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.caption1.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(30),
                  MainButton(
                    text: 'Login',
                    onTap: () {
                      if (cubit.formKey.currentState!.validate()) {
                        cubit.login();
                      }
                    },
                  ),
                  Gap(35),
                  Row(
                    spacing: 25,
                    children: [
                      Expanded(
                        child: Divider(color: AppColors.borderColor),
                      ),
                      Text('Or'),
                      Expanded(
                        child: Divider(color: AppColors.borderColor),
                      ),
                    ],
                  ),
                  Gap(20),
                  SignInWith(
                    image: AppImages.appleSvg,
                    text: 'Sign in with Apple',
                  ),
                  Gap(10),
                  SignInWith(
                    image: AppImages.googleSvg,
                    text: 'Sign in with Google',
                  ),
                  Spacer(),
                  BottomText(
                    text: 'Don’t have an account?  ',
                    textButton: 'Register Now',
                    onTap: () {
                      pushTo(context, RegisterScreen());
                    },
                  ),
                  Gap(20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

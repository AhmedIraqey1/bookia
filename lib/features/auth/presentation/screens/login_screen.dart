import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgits/Email_feild.dart';
import 'package:bookia/core/widgits/dialogs.dart';
import 'package:bookia/core/widgits/main_button.dart';
import 'package:bookia/core/widgits/my_padding.dart';
import 'package:bookia/core/widgits/my_safe_area.dart';
import 'package:bookia/core/widgits/passwordt_feild%20.dart';
import 'package:bookia/features/auth/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/screens/forget_password.dart';
import 'package:bookia/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:bookia/features/auth/cubit/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MySafeArea(
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
          body: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                pop(context);
                // Show success message or navigate to another screen
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Login successful!')));
                // Optionally, navigate to the login screen or home screen
                pushReplacementTo(context, LoginScreen());
              } else if (state is AuthError) {
                pop(context);
                // Show error message
                showErrorDialog(state.message, context);
              }
              if (state is AuthLoading) {
                // Show loading message
                showDialogLoading(context);
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              var authCubit = context.read<AuthCubit>();
              return MyPadding(
                child: Form(
                  key: authCubit.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          'Welcome back! Glad to see you, Again!',
                          style: TextStyles.headline.copyWith(fontSize: 35),
                        ),
                        Gap(35),
                        EmailFeild(
                          hintText: 'Email',
                          controller: authCubit.emailController,
                        ),
                        Gap(15),
                        PasswordFeild(
                          hintText: 'Password',
                          controller: authCubit.passwordController,
                        ),
                        Gap(15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pushTo(context, ForgetPasswordScreen());
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyles.caption.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(30),
                        MainButton(
                          text: 'Login',
                          onPressed: () {
                            if (authCubit.formKey.currentState!.validate()) {
                              authCubit.login();
                            }
                          },
                          height: 60,
                        ),
                        Gap(30),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: AppColors.dark.withOpacity(0.1),
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: Text(
                                'OR',
                                style: TextStyles.caption.copyWith(
                                  color: AppColors.dark,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: AppColors.dark.withOpacity(0.1),
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        Gap(30),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.dark.withOpacity(0.1),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcons.google),
                              Gap(10),
                              Text(
                                'Continue with Google',
                                style: TextStyles.button.copyWith(
                                  color: AppColors.dark,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(15),
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.dark.withOpacity(0.1),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppIcons.apple),
                              Gap(10),
                              Text(
                                'Continue with Apple',
                                style: TextStyles.button.copyWith(
                                  color: AppColors.dark,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(130),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyles.body.copyWith(
                                color: AppColors.dark,
                              ),
                            ),
                            Gap(5),
                            GestureDetector(
                              onTap: () {
                                pushReplacementTo(context, RegisterScreen());
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyles.body.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

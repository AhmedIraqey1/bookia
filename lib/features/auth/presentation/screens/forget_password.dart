import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgits/Email_feild.dart';
import 'package:bookia/core/widgits/dialogs.dart';
import 'package:bookia/core/widgits/main_button.dart';
import 'package:bookia/core/widgits/my_padding.dart';
import 'package:bookia/core/widgits/my_safe_area.dart';
import 'package:bookia/features/auth/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/screens/login_screen.dart';
import 'package:bookia/features/auth/presentation/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
              if (state is AuthLoading) {
                showDialogLoading(context);
              } else if (state is AuthSuccess) {
                pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Reset successful!')));
                pushReplacementTo(context, LoginScreen());
              } else if (state is AuthError) {
                pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('An error occurred.')));
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              var authCubit = context.read<AuthCubit>();
              return MyPadding(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: TextStyles.headline.copyWith(fontSize: 35),
                            ),
                          ],
                        ),
                        Gap(15),
                        Text(
                          "Don't worry! It occurs. Please enter the email address linked with your account.",
                          style: TextStyles.body.copyWith(
                            color: AppColors.iconsColor,
                          ),
                        ),
                        Gap(35),
                        EmailFeild(hintText: 'Email'),
                        Gap(35),
                        MainButton(
                          text: 'Send Code',
                          onPressed: () {
                            // TODO: Implement reset password logic
                            authCubit.forgetPassword();
                            // pushTo(context, const OtpScreen());
                          },
                          height: 60,
                        ),
                        Gap(450),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Remember password? ",
                              style: TextStyles.body.copyWith(
                                color: AppColors.iconsColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                pushTo(context, const LoginScreen());
                              },
                              child: Text(
                                'Login',
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

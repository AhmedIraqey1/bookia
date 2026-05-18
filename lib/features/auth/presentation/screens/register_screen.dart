import 'package:bookia/core/constants/app_icons.dart';
import 'package:bookia/core/functions/navigations.dart';
import 'package:bookia/core/styles/colors.dart';
import 'package:bookia/core/styles/text_styles.dart';
import 'package:bookia/core/widgits/Email_feild.dart';
import 'package:bookia/core/widgits/custom_text_form_feild.dart';
import 'package:bookia/core/widgits/dialogs.dart';
import 'package:bookia/core/widgits/main_button.dart';
import 'package:bookia/core/widgits/my_padding.dart';
import 'package:bookia/core/widgits/my_safe_area.dart';
import 'package:bookia/core/widgits/passwordt_feild%20.dart';
import 'package:bookia/features/auth/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                ).showSnackBar(SnackBar(content: Text('Register successful!')));
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
                          'Hello! Register to get started',
                          style: TextStyles.headline.copyWith(fontSize: 35),
                        ),
                        Gap(35),
                        CustomTextFormFeild(
                          hintText: 'username',
                          readOnly: false,
                        ),
                        Gap(15),
                        EmailFeild(hintText: 'Email'),
                        Gap(15),
                        PasswordFeild(hintText: 'Password'),
                        Gap(15),
                        PasswordFeild(hintText: 'Confirm password'),

                        Gap(30),

                        MainButton(
                          text: 'Register',
                          onPressed: () {
                            if (authCubit.formKey.currentState!.validate()) {
                              authCubit.register();
                            }
                          },
                          height: 60,
                        ),

                        Gap(230),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyles.body.copyWith(
                                color: AppColors.dark,
                              ),
                            ),
                            Gap(5),
                            GestureDetector(
                              onTap: () {
                                pushReplacementTo(context, LoginScreen());
                              },
                              child: Text(
                                'Login now',
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

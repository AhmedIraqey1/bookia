import 'package:bloc/bloc.dart';
import 'package:bookia/features/auth/cubit/auth_state.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    emit(AuthLoading());
    var response = await AuthRepo.login(
      RegisterParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthError(message: 'Login failed. Please check your information and try again.'));
    }
  }

  Future<void> register() async {
    emit(AuthLoading());
    var response = await AuthRepo.register(
      RegisterParams(
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        name: usernameController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthError(message: 'Registration failed. Please check your information and try again.'));
    }
  }
   Future<void> forgetPassword()async {
    emit(AuthLoading());
    var response = await AuthRepo.forgetPassword(emailController.text);
    if (response != null && (response.statusCode == 200 || response.statusCode == 201)) {
      emit(AuthSuccess());
    } else {
      emit(AuthError(message: 'Reset password failed. Please check your email and try again.'));
    }
   }
  // ضيف الدالة دي في آخر ملف الـ AuthCubit قبل قوس الإغلاق الأخير }
  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    passwordConfirmationController.dispose();
    return super.close();
  }
}

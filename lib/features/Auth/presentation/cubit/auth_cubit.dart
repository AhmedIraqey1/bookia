import 'package:bookia/features/Auth/data/models/register_params.dart';
import 'package:bookia/features/Auth/data/repo/auth_repo.dart';
import 'package:bookia/features/Auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  login() async {
    emit(AuthLoadingState());
   var response= await AuthRepo.login(RegisterParams(email: 'asd@af.com',password: '16544'));
   if(response != null){
    emit(AuthSuccessState());

   }else {
    emit(AuthErrorState());
   }
  }
  Future<void> register() async {
    emit(AuthLoadingState());
    var response = await AuthRepo.register(
      RegisterParams(
        name: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
      ),
    );
    if (response != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState());
    }
  }
}







// UI => cubit(function) => Repo (Request Api)
// Repo (Response) => Cubit(States) => UI
import 'dart:developer';

import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/features/auth/data/models/auth_response/data.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_response.dart';

class AuthRepo {
  static Future<AuthResponse?> register(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
        Apis.register,
        data: params.toJson(),
        endpoint: Apis.register,
      );
      if (response.statusCode == 201) {
        response.data; // json (map)
        // parse from json to model
        //return model
        var data = AuthResponse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
        Apis.login,
        data: params.toJson(),
        endpoint: Apis.login,
      );
      if (response.statusCode == 200) {
        response.data; // json (map)
        // parse from json to model
        //return model
        var data = AuthResponse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<dynamic> forgetPassword(String email) async {
    try {
      var response = await DioProvider.post(
        'forget-password',
        data: {'email': email},
        endpoint: Apis.forgetPassword,
      );
      return response;
    } catch (e) {
      print('Error in forgetPassword Repo: ${e.toString()}');
      return null;
    }
  }
}

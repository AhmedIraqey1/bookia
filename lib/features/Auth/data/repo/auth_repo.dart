import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';

import 'package:bookia/features/Auth/data/models/register_response/register_response.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  Future<RegisterResponse?> register() async {
    try {
      var response = await Dio().post(
        'https://codingarabic.online/ap/register',
        data: {
          "name": "Ahmed",
          "email": "sayed888@gmail.com",
          "password": "12345678",
          "password_confirmation": "12345678",
        },
      );
      if (response.statusCode == 201) {
        response.data;
        RegisterResponse data = RegisterResponse.fromJson(response.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString() as num);
      return null;
    }
  }
}

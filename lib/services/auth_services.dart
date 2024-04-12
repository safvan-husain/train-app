// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'package:train_app/common/constant_variables.dart';
import 'package:train_app/common/error.dart';
import 'package:train_app/common/response.dart';
import 'package:train_app/global_state/user_state_controller.dart';
import 'package:train_app/models/user_model.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';
import 'package:train_app/screens/home/main_screen.dart';

class AuthServices {
  static final Dio _dio = Dio();

  static void init() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, s) async {
        // Check if the error has a response
        if (e.response != null) {
          // Extract the error message from the response
          String errorMessage =
              e.response?.data['message'] ?? "An error occurred";
          // Display the error message in a snackbar
          Get.snackbar(
            "Error",
            errorMessage,
            backgroundColor: Get.theme.scaffoldBackgroundColor,
          );
        } else {
          // If there's no response, display a generic error message
          Get.snackbar(
            "Error",
            "An error occurred",
            backgroundColor: Get.theme.scaffoldBackgroundColor,
          );
        }
      },
    ));
  }

  static Future<UserModel> registerUser({
    required String name,
    String? email,
    String? phone,
    String? password,
  }) async {
    if (phone == null && email == null) {
      throw AppError("Either phone or email is required");
    } else if (email == null && password == null) {
      throw AppError("Password is required");
    }

    try {
      String? firebaseToken = await FirebaseMessaging.instance.getToken();
      var result = await _dio.post(
        '${CV.baseUri}/register',
        data: {
          "email": email,
          "name": name,
          "phone": phone,
          "password": password,
          "token": firebaseToken,
        },
      );
      return UserModel.fromMap(result.data);
    } catch (e) {
      print(e);
      throw AppError("error on registerUser services");
    }
  }

  static Future<UserModel> loginUser({
    String? email,
    String? phone,
    String? password,
  }) async {
    if (phone == null && email == null) {
      throw AppError("Either phone or email is required");
    } else if (email == null && password == null) {
      throw AppError("Password is required");
    }

    try {
      String? firebaseToken = await FirebaseMessaging.instance.getToken();
      // AppResponse2 result = AppResponse2(
      //     statusCode: 200, data: {"phone": "79000000", "name": "Safvan"});
      var result = await _dio.post(
        '${CV.baseUri}/log-in',
        data: {
          "email": email,
          "phone": phone,
          "password": password,
          "token": firebaseToken,
        },
      );
      print(result.data);
      return UserModel.fromMap(result.data);
    } catch (e) {
      print(e);
      throw AppError("error on login user service");
    }
  }

  static Future<void> getOtp(String phone) async {
    try {
      await _dio.get("${CV.baseUri}/send-otp?phone=$phone");
    } catch (e) {
      print(e);
      throw AppError(
        "failed to complete the get otp api call",
      );
    }
  }

  static Future<UserModel> verifyOtp(
    String phone,
    String otp,
    String name,
    String password,
  ) async {
    try {
      await _dio.get("${CV.baseUri}/verify-otp?phone=$phone&&otp=$otp");
      return await registerUser(name: name, phone: phone, password: password);
    } catch (e) {
      print(e);
      throw AppError("Failed to verify OTP");
    }
  }

  static Future<UserModel> authViaGoogle(String email, String name) async {
    try {
      String? firebaseToken = await FirebaseMessaging.instance.getToken();
      var response = await _dio.post("${CV.baseUri}/auth-via-google", data: {
        "email": email,
        "name": name,
        "token": firebaseToken,
      });
      return UserModel.fromJson(response.data);
    } catch (e) {
      print(e);
      throw AppError('error on auth via google service');
    }
  }

  static Future<void> updateFirebaseToken({
    String? email,
    String? phone,
    required String token,
  }) async {
    try {
      await _dio.post("${CV.baseUri}/update-token", data: {
        "email": email,
        'phone': phone,
        "token": token,
      });
    } catch (e) {
      print(e);
      throw AppError('error on update firebase token service');
    }
  }
}

class AppResponse2 {
  final int statusCode;
  final Map<String, dynamic> data;
  AppResponse2({
    required this.statusCode,
    required this.data,
  });
}

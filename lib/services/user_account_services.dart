import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_app/common/constant_variables.dart';
import 'package:train_app/common/error.dart';
import 'package:train_app/global_state/user_state_controller.dart';
import 'package:train_app/models/availilble_seat_model.dart';
import 'package:train_app/models/notification_model.dart';
import 'package:train_app/models/train_info_model.dart';
import 'package:train_app/models/user_model.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';

class UserAccountServices {
  static final Dio _dio = Dio();

  static void init() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, s) async {
        HomeBloc.instance.add(LoadingEnded());
        // Check if the error has a response
        if (e.response != null) {
          print(e.response?.data);
          // Extract the error message from the response
          String errorMessage =
              e.response?.data['message'].toString() ?? "An error occurred";
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

  static Future<UserModel> editUser({
    required String name,
    required String email,
    required String phone,
  }) async {
    try {
      var result = await _dio.post(
        '${CV.baseUri}/edit-profile',
        options: Options(
          headers: {
            'x-auth-token': UserController.instance.user.value?.jsonWebToken
          },
        ),
        data: {
          "email": email,
          "name": name,
          "phone": phone,
        },
      );
      return UserModel.fromMap(result.data);
    } catch (e) {
      print(e);
      throw AppError("error on edit user services");
    }
  }

  static Future<bool> verifyOtp(
    String phone,
    String otp,
  ) async {
    try {
      return true;
      // await _dio.get("${CV.baseUri}/verify-otp?phone=$phone&&otp=$otp");
      return true;
    } catch (e) {
      print(e);
      throw AppError("Failed to verify OTP");
    }
  }

  static Future<List<NotificationModel>> getNotifications() async {
    try {
      final result = await _dio.get(
        "${CV.baseUri}/notifcations",
        options: Options(
          headers: {
            'x-auth-token': UserController.instance.user.value?.jsonWebToken
          },
        ),
      );
      if (result.statusCode == 200) {
        return NotificationModel.fromMapList(result.data);
      }
      return [];
    } catch (e) {
      print(e);
      throw AppError("Failed to verify OTP");
    }
  }
}

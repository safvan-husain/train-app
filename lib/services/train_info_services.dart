import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_app/common/constant_variables.dart';
import 'package:train_app/common/error.dart';
import 'package:train_app/global_state/user_state_controller.dart';
import 'package:train_app/models/availilble_seat_model.dart';
import 'package:train_app/models/train_info_model.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';

class TrainInfoServices {
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

  static Future<List<TrainInfoModel>> getTrainInBetweenStations({
    required String fromStationCode,
    required String toStationCode,
  }) async {
    try {
      log(UserController.instance.user.value?.jsonWebToken ?? "np web token ");
      final response = await _dio.post(
        '${CV.baseUri}/train-in-between',
        options: Options(headers: {
          'x-auth-token': UserController.instance.user.value?.jsonWebToken
        }),
        data: {
          'depature': fromStationCode,
          'arrival': toStationCode,
        },
      );
      if (response.statusCode == 200) {
        return TrainInfoModel.fromMapList(response.data);
      }
      return [];
      // throw AppError(response.data['message']);
    } catch (e) {
      print("$e : error in getTraininbetwwn");
      throw AppError('Internal error');
    }
  }

  static Future<List<AvailibeSeat>> checkSeats() async {
    try {
      log(UserController.instance.user.value?.jsonWebToken ?? "np web token ");
      final response = await _dio.get(
        '${CV.baseUri}/seats-availiblity',
        options: Options(
          headers: {
            'x-auth-token': UserController.instance.user.value?.jsonWebToken
          },
        ),
      );
      if (response.statusCode == 200) {
        return AvailibeSeat.fromMapList(response.data);
      }
      return [];
      // throw AppError(response.data['message']);
    } catch (e) {
      print("$e : error in checkseat");
      throw AppError('Internal error');
    }
  }
}

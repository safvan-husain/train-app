import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meta/meta.dart';
import 'package:train_app/global_state/user_state_controller.dart';
import 'package:train_app/helpers/station_code_helper.dart';
import 'package:train_app/screens/auth/initial/splash_screen.dart';
import 'package:train_app/screens/auth/login_screen.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final StationCodeHelper stationCodeHelper = StationCodeHelper();
  HomeBloc() : super(HomeState.initial()) {
    on<EnterStationCode>((event, emit) {
      emit(state.copyWith(isOnSearch: true));
    });

    on<LogOutUser>((event, emit) {
      UserController.instance.logOutUser();
      Get.offAll(() => LoginScreen());
      emit(HomeState.initial());
    });

    on<StationCodeSelected>((event, emit) {
      if (event.isDepatureField) {
        log("depature changing");

        emit(state.copyWith(
          isOnSearch: false,
          depature: event.stationCode,
        ));
      } else {
        log("arrival changing");
        emit(state.copyWith(
          isOnSearch: false,
          arrival: event.stationCode,
        ));
      }
    });

    on<SwitchStations>((event, emit) {
      String? temp = state.depature;
      emit(state.copyWith(
        depature: state.arrival,
        arrival: temp,
      ));
    });

    on<GetTrainResults>((event, emit) {
      emit(state.copyWith(isOnResult: true));
    });

    on<ShowSettings>((event, emit) {
      emit(
        state.copyWith(instance: HomeStateInstanceType.settings),
      );
    });

    on<ShowMainScreen>((event, emit) {
      emit(state.copyWith(instance: HomeStateInstanceType.initial));
    });

    on<CancelTrainResult>((event, emit) {
      emit(state.copyWith(isOnResult: false));
    });

    on<DateSelected>((event, emit) {
      emit(state.copyWith(date: event.date));
    });

    on<FilterStations>((event, emit) {
      emit(
        state.copyWith(
          values: stationCodeHelper.stations.keys
              .where((element) =>
                  element.startsWith(event.searchTerm.toUpperCase()))
              .toList(),
        ),
      );
    });
  }
}

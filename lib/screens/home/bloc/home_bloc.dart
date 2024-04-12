import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_app/common/error.dart';
import 'package:train_app/global_state/user_state_controller.dart';
import 'package:train_app/helpers/station_code_helper.dart';
import 'package:train_app/models/train_info_model.dart';
import 'package:train_app/models/user_model.dart';
import 'package:train_app/screens/auth/login_screen.dart';
import 'package:train_app/screens/auth/verification_screen.dart';
import 'package:train_app/screens/home/main_screen.dart';
import 'package:train_app/screens/home/sub_screens/widgets/seat_availiblity_bottom_sheet.dart';
import 'package:train_app/services/auth_services.dart';
import 'package:train_app/services/train_info_services.dart';
import 'package:train_app/services/user_account_services.dart';

part 'home_event.dart';
part 'home_state.dart';

//when is loading true, in the main_screen line 33 [AbsorbPointer] will absorb any screen,
// not letting the user intract with the app.

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final StationCodeHelper stationCodeHelper = StationCodeHelper();

  static HomeBloc instance = Get.find<HomeBloc>();

  HomeBloc() : super(HomeState.initial()) {
    on<ResetHomeEvent>((event, emit) {
      emit(HomeState.initial());
    });

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

    on<GetTrainResults>((event, emit) async {
      // if (state.arrival != null && state.depature != null) {
      emit(state.copyWith(isOnResult: true, isLoading: true));
      try {
        final result = await TrainInfoServices.getTrainInBetweenStations(
            fromStationCode: state.depature ?? '',
            toStationCode: state.arrival ?? '');
        emit(
          state.copyWith(isOnResult: true, trainList: result, isLoading: false),
        );
      } catch (e) {
        emit(
          state.copyWith(isOnResult: true, trainList: [], isLoading: false),
        );
        if (e is AppError) {
          Get.snackbar(
            'Invalid',
            e.message,
            backgroundColor: Get.theme.scaffoldBackgroundColor,
          );
        }

        print(e);
      }
      // } else {
      //   Get.snackbar('Inavalid', "Please select stations",    backgroundColor: Get.theme.scaffoldBackgroundColor,);
      // }
    });

    on<CheckSeatAvailiblity>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));
        var result = await TrainInfoServices.checkSeats();
        emit(state.copyWith(isLoading: false));
        Get.bottomSheet(SeatBottomSheet(result));
      } catch (e) {
        emit(state.copyWith(isLoading: false));
        if (e is AppError) {
          Get.snackbar(
            'Invalid',
            e.message,
            backgroundColor: Get.theme.scaffoldBackgroundColor,
          );
        }

        print(e);
      }
    });
    on<VerifyOtpHomeEvent>((event, emit) async {
      log('verify otp home event calledd');
      if (event.otp.length == 4) {
        emit(state.copyWith(isLoading: true));
        try {
          log('before verify http call');
          bool isCorrect = await UserAccountServices.verifyOtp(
            event.phone,
            event.otp,
          );
          log("${isCorrect ? "" : "in"}correct otp");
          if (isCorrect) {
            try {
              UserModel user = await UserAccountServices.editUser(
                name: event.name,
                email: event.email,
                phone: event.phone,
              );
              log('user edited succesfully');
              UserController.instance.updateUser(user);
              Get.offAll(() => const MainScreen());
              Get.snackbar(
                "Success",
                "Profile editted successfully",
                backgroundColor: Get.theme.scaffoldBackgroundColor,
              );
              emit(state.copyWith(isLoading: false));
            } catch (e) {
              print(e);
              emit(state.copyWith(isLoading: false));
              if (e is AppError) {
                Get.snackbar(
                  'Invalid',
                  e.message,
                  backgroundColor: Get.theme.scaffoldBackgroundColor,
                );
              }
            }
          }
        } catch (e) {
          if (e is AppError) {
            Get.snackbar(
              "Verification failed",
              e.message,
              backgroundColor: Get.theme.scaffoldBackgroundColor,
            );
          }
        }
      } else {
        Get.snackbar(
          "Invalid",
          "Invalid OTP",
          backgroundColor: Get.theme.scaffoldBackgroundColor,
        );
      }
    });

    on<EditProfileEvent>((event, emit) async {
      if (event.name.isEmpty ||
          event.email.isEmpty ||
          event.phone.length != 10) {
        Get.snackbar(
          'Invalid',
          "Input invalid",
          backgroundColor: Get.theme.scaffoldBackgroundColor,
        );
        return;
      } //if phone has changed we want to verify with otp.
      if (UserController.instance.user.value?.phone != event.phone) {
        log("phone has changed");
        try {
          // await AuthServices.getOtp(event.phone);
          //we use password argument to pass email :)
          Get.offAll(VerificationScreen(
            phone: event.phone,
            name: event.name,
            password: event.email,
            isAuth: false,
          ));
        } catch (e) {
          if (e is AppError) {
            Get.snackbar(
              "Verification failed",
              e.message,
              backgroundColor: Get.theme.scaffoldBackgroundColor,
            );
          }
        }
      } else {
        log("phone hasn't changed");
        try {
          emit(state.copyWith(isLoading: true));
          UserController.instance.updateUser(await UserAccountServices.editUser(
            name: event.name,
            email: event.email,
            phone: event.phone,
          ));
          Get.snackbar(
            "Success",
            "Profile editted successfully",
            backgroundColor: Get.theme.scaffoldBackgroundColor,
          );
          emit(state.copyWith(isLoading: false));
        } catch (e) {
          emit(state.copyWith(isLoading: false));
          if (e is AppError) {
            Get.snackbar(
              'Invalid',
              e.message,
              backgroundColor: Get.theme.scaffoldBackgroundColor,
            );
          }
        }
      }
    });

    on<ShowSettings>((event, emit) {
      emit(
        state.copyWith(instance: HomeStateInstanceType.settings),
      );
    });

    on<LoadingEnded>((event, emit) {
      emit(
        state.copyWith(isLoading: false),
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

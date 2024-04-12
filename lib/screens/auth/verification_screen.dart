// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:train_app/screens/auth/bloc/auth_bloc.dart';
import 'package:train_app/screens/auth/bloc/auth_state_event.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';

class VerificationScreen extends StatelessWidget {
  final String phone;
  final String name;
  final String password;
  final bool isAuth;
  const VerificationScreen({
    Key? key,
    required this.phone,
    required this.name,
    required this.password,
    this.isAuth = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 150,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            children: [
              Text(
                "OTP code veirification",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).focusColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text(
                  'We have sent an OTP code to +934658716585 Enter the OTP code below to verify',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 20),
              OtpTextField(
                clearText: true,
                numberOfFields: 4,
                borderColor: Colors.grey,
                enabledBorderColor: Colors.grey,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  log(code);
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (v) async {
                  if (isAuth) {
                    AuthBloc.instance.add(VerifyOtpEvent(
                      v,
                      phone,
                      name,
                      password,
                    ));
                  } else {
                    log("it is not auth so calling home verigy");
                    HomeBloc.instance
                        .add(VerifyOtpHomeEvent(v, name, phone, password));
                  }
                }, // end onSubmit
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: GestureDetector(
                  onTap: () async {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Resend OTP?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Theme.of(context).focusColor,
                ),
                onPressed: () {
                  // AuthBloc.instance.add(VerifyOtpEvent(v, phone));
                },
                child: Text(
                  "Verify",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:train_app/global_state/user_state_controller.dart';
import 'package:train_app/screens/auth/initial/splash_screen.dart';
import 'package:train_app/screens/auth/login_screen.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';

class CustomDialuge extends StatelessWidget {
  const CustomDialuge({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: DailoueCard(),
    );
  }
}

class DailoueCard extends StatelessWidget {
  const DailoueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 237, 249, 243),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.warning_amber,
            size: 80,
          ),
          Text(
            "Are you sure you want to leave?",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(LogOutUser());
            },
            child: Container(
              width: double.infinity,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Theme.of(context).focusColor),
              ),
              child: Text(
                "Log Out",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).focusColor),
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: double.infinity,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                "Cancel",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

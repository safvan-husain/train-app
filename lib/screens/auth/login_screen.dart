import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_app/screens/auth/bloc/auth_bloc.dart';
import 'package:train_app/screens/auth/bloc/auth_state_event.dart';
import 'package:get/get.dart';
import 'package:train_app/screens/auth/registen_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _phoneController =
      TextEditingController(text: '9072817417');
  final TextEditingController _passwordController =
      TextEditingController(text: 'pass');
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).focusColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text("Login with you email ID"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // TextField(
                  //   decoration: InputDecoration(
                  //       hintText: "Username",
                  //       prefixIcon: Icon(
                  //         FontAwesomeIcons.user,
                  //         color: Colors.grey,
                  //       ),
                  //       border: InputBorder.none,
                  //       hintStyle: Theme.of(context)
                  //           .textTheme
                  //           .bodyMedium!
                  //           .copyWith(color: Colors.grey)),
                  // ),
                  TextField(
                    controller: _phoneController,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    decoration: InputDecoration(
                        hintText: "Phone",
                        prefixIconConstraints:
                            const BoxConstraints(maxWidth: 80),
                        prefixIcon: Center(
                          child: Text(
                            "🇮🇳  +91  ",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 16, color: Colors.black),
                          ),
                        ),
                        border: InputBorder.none,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey)),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon:
                            Icon(Icons.lock_outline, color: Colors.grey),
                        suffixIcon: Icon(
                          FontAwesomeIcons.eyeSlash,
                          color: Colors.grey,
                          size: 20,
                        ),
                        border: InputBorder.none,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey)),
                  ),
                  Text(
                    "Forgot Passowrd?",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                  )
                ]
                    .map(
                      (e) => Container(
                          // height: 70,
                          decoration: e is Text
                              ? null
                              : BoxDecoration(
                                  // color: Theme.of(context).highlightColor,
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                          margin: e is Text
                              ? const EdgeInsets.symmetric(vertical: 0)
                              : const EdgeInsets.symmetric(vertical: 10),
                          child: e),
                    )
                    .toList(),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    double.infinity,
                    50,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Theme.of(context).focusColor,
                ),
                onPressed: () {
                  AuthBloc.instance.add(LoginEvent(
                    phone: _phoneController.text,
                    password: _passwordController.text,
                  ));
                },
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 40, child: Divider()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Or Continue with",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(width: 40, child: Divider()),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<AuthBloc>().add(AuthRegisterGoogle());
                      },
                      child: Image.asset(
                          'assets/icons/google${isDarkMode ? "-dark" : ""}.png'),
                    ),
                    Image.asset(
                        'assets/icons/twitter${isDarkMode ? "-dark" : ""}.png'),
                    Image.asset(
                        'assets/icons/apple${isDarkMode ? "-dark" : ""}.png')
                  ],
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Get.to(RegisterScreen());
                  },
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: ' Sign Up',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

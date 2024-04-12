import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_app/screens/auth/bloc/auth_bloc.dart';
import 'package:train_app/screens/auth/bloc/auth_state_event.dart';
import 'package:train_app/screens/auth/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 80,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Create Account",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).focusColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Text("Login with you email ID"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: "Username",
                        prefixIcon: const Icon(
                          FontAwesomeIcons.user,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey)),
                  ),
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
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.grey,
                        ),
                        suffixIcon: const Icon(
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
                  TextField(
                    controller: _confirmController,
                    decoration: InputDecoration(
                        hintText: "Confirm Password",
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.grey,
                        ),
                        suffixIcon: const Icon(
                          FontAwesomeIcons.eyeSlash,
                          size: 20,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.grey)),
                  ),
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
                  if (_passwordController.text.isEmpty) {
                    Get.snackbar(
                      "Invalid",
                      "Password is required",
                      colorText: Colors.deepOrange,
                      backgroundColor: Get.theme.scaffoldBackgroundColor,
                    );
                    return;
                  }
                  if (_passwordController.text == _confirmController.text) {
                    AuthBloc.instance.add(AuthRegister(
                      _nameController.text,
                      _phoneController.text,
                      _passwordController.text,
                    ));
                  } else {
                    Get.snackbar(
                      'Invaild',
                      "Password mismatch",
                      colorText: Colors.deepOrange,
                      backgroundColor: Get.theme.scaffoldBackgroundColor,
                    );
                  }
                },
                child: Text(
                  "Continue",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Get.offAll(() => LoginScreen());
                  },
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'I have an account? ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: ' Login',
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

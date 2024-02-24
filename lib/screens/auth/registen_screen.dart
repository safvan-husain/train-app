import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  Text("Login with you email ID"),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Username",
                      prefixIcon: Icon(FontAwesomeIcons.user),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.mail_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: Icon(FontAwesomeIcons.eyeSlash),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).hoverColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock_outline),
                      suffixIcon: Icon(FontAwesomeIcons.eyeSlash),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).hoverColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Phone number",
                      prefixIcon: Icon(FontAwesomeIcons.phone),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).hoverColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ]
                    .map(
                      (e) => Container(
                          height: 70,
                          padding: e is Text
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
                onPressed: () {},
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).cardColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Center(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

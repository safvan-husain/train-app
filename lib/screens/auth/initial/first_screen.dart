import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_app/screens/auth/login_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<List> screenContents = [
    [
      "assets/images/auth1.png",
      "You can buy tickets from anywhere at any time"
    ],
    [
      "assets/images/auth2.png",
      "You Can easily find your train",
    ],
    [
      "assets/images/auth3.png",
      "Whenever you want, you can buy a metro ticket"
    ],
  ];
  int currentContentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Expanded(
                  child: Image.asset(screenContents[currentContentIndex][0])),
              // const SizedBox(height: 20),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 80,
                      child: Text(
                        screenContents[currentContentIndex][1],
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.bold,
                            ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 5),
                          height: 5,
                          width: currentContentIndex == 0 ? 20 : 5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(width: 10),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 5),
                          height: 5,
                          width: currentContentIndex == 1 ? 20 : 5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(width: 10),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 5),
                          height: 5,
                          width: currentContentIndex == 2 ? 20 : 5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorLight,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              if (currentContentIndex == 2) {
                Get.off(() => LoginScreen());
              } else {
                currentContentIndex++;
              }
            },
          );
        },
        backgroundColor: Theme.of(context).focusColor,
        elevation: 0,
        child: Icon(
          Icons.arrow_right_alt,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }
}

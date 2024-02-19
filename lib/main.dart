import 'package:flutter/material.dart';
import 'package:train_app/screens/home/main_screen.dart';
import 'package:train_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.light,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

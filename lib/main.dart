import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_app/screens/auth/login_screen.dart';
import 'package:train_app/screens/auth/registen_screen.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';
import 'package:train_app/screens/home/main_screen.dart';
import 'package:train_app/theme/theme.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeBloc(),
      ),
      // BlocProvider(
      //   create: (context) => SubjectBloc(),
      // ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.light, darkTheme: MyTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      // home: const LoginScreen(),
      home: const MainScreen(),
    );
  }
}

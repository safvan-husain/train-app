import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:train_app/global_state/user_state_controller.dart';
import 'package:train_app/screens/auth/bloc/auth_bloc.dart';
import 'package:train_app/screens/auth/initial/splash_screen.dart';
import 'package:train_app/screens/auth/login_screen.dart';
import 'package:train_app/screens/auth/registen_screen.dart';
import 'package:train_app/screens/home/bloc/home_bloc.dart';
import 'package:train_app/screens/home/main_screen.dart';
import 'package:train_app/services/auth_services.dart';
import 'package:train_app/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  AuthServices.init();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    appId: '1:667111154875:android:d907b73257281754fbf59e',
    apiKey: 'AIzaSyBUEXbzX1pBZd31EA0gsIJhg6df_bPhN10',
    projectId: 'railway-8fd72',
    messagingSenderId: '667111154875',
  ));
  Get.put(AuthBloc());
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeBloc(),
      ),
      BlocProvider(
        create: (context) => AuthBloc.instance,
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.light,
      darkTheme: MyTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      // home: FirstScreen(),
      home: const SplashScreen(),
    );
  }
}

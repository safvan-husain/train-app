import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:train_app/common/error.dart';
import 'package:train_app/global_state/user_state_controller.dart';
import 'package:train_app/models/user_model.dart';
import 'package:train_app/screens/auth/bloc/auth_state_event.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:train_app/screens/auth/initial/first_screen.dart';
import 'package:train_app/screens/auth/verification_screen.dart';
import 'package:train_app/screens/home/main_screen.dart';
import 'package:train_app/services/auth_services.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  static AuthBloc instance = Get.find<AuthBloc>();

  AuthBloc() : super(AuthState.init()) {
    on<AuthRegisterGoogle>((event, emit) async {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? googleUser = authResult.user;
        if (googleUser != null && googleUser.email != null) {
          UserModel user = await AuthServices.authViaGoogle(
            googleUser.email!,
            googleUser.displayName ?? googleUser.email!.split("@").first,
          );

          UserController.instance.updateUser(user);
          Get.offAll(() => const MainScreen());
        } else {
          Get.snackbar(
            "Error",
            "Email not provided by google",
            backgroundColor: Get.theme.scaffoldBackgroundColor,
          );
        }
      }
    });

    on<AuthCheckUserExistance>((event, emit) {
      UserModel? user = UserController.instance.user.value;
      if (user != null) {
        Get.offAll(() => const MainScreen());
      } else {
        Get.off(() => const FirstScreen());
      }
    });

    on<AuthRegister>((event, emit) async {
      if (event.phone.isNotEmpty &&
          event.name.isNotEmpty &&
          event.password.isNotEmpty) {
        try {
          await AuthServices.getOtp(event.phone);
          Get.offAll(VerificationScreen(
            phone: event.phone,
            name: event.name,
            password: event.password,
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
        Get.snackbar(
          "Inavalid",
          "fill all the fiealds",
          backgroundColor: Get.theme.scaffoldBackgroundColor,
        );
      }
    });

    on<VerifyOtpEvent>((event, emit) async {
      if (event.otp.length == 4) {
        try {
          UserModel user = await AuthServices.verifyOtp(
              event.phone, event.otp, event.name, event.password);
          UserController.instance.updateUser(user);
          Get.offAll(() => const MainScreen());
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

    on<LoginEvent>((event, emit) async {
      if (event.phone.length == 10) {
        if (event.password.isNotEmpty) {
          try {
            UserModel user = await AuthServices.loginUser(
              phone: event.phone,
              password: event.password,
            );
            UserController.instance.updateUser(user);
            Get.offAll(() => const MainScreen());
          } catch (e) {
            if (e is AppError) {
              Get.snackbar(
                "Verification failed",
                e.message,
                backgroundColor: Get.theme.scaffoldBackgroundColor,
              );
            }
          }
        }
      } else {
        Get.snackbar(
          "Invalid",
          "Invalid Phone",
          backgroundColor: Get.theme.scaffoldBackgroundColor,
        );
      }
    });
  }
}

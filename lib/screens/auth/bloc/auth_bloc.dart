import 'package:bloc/bloc.dart';
import 'package:train_app/screens/auth/bloc/auth_state_event.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthBloc() : super(AuthState.init()) {
    on<AuthShowGoogle>((event, emit) async {
      // final GoogleSignInAccount? googleSignInAccount =
      //     await _googleSignIn.signIn();

      // if (googleSignInAccount != null) {
      //   final GoogleSignInAuthentication googleSignInAuthentication =
      //       await googleSignInAccount.authentication;

      //   final AuthCredential credential = GoogleAuthProvider.credential(
      //     accessToken: googleSignInAuthentication.accessToken,
      //     idToken: googleSignInAuthentication.idToken,
      //   );

      //   final UserCredential authResult =
      //       await _auth.signInWithCredential(credential);
      //   final User? user = authResult.user;
      //   if (user != null) {}
      // }
    });
  }
}

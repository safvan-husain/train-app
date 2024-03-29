import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train_app/screens/auth/bloc/auth_bloc.dart';
import 'package:train_app/screens/auth/bloc/auth_state_event.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthCheckUserExistance());
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

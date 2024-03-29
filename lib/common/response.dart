// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:train_app/models/user_model.dart';

class AppResponse {
  final bool status;
  final String message;

  AppResponse({
    required this.status,
    required this.message,
  });
}

class AuthResponse extends AppResponse {
  final UserModel? user;
  AuthResponse({
    required super.status,
    super.message = '',
    this.user,
  });
}

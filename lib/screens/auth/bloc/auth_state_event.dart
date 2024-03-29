// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthEvent {}

class AuthRegisterGoogle extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String phone;
  final String password;
  LoginEvent({
    required this.phone,
    required this.password,
  });
}

class AuthCheckUserExistance extends AuthEvent {}

class AuthRegister extends AuthEvent {
  final String name;
  final String phone;
  final String password;

  AuthRegister(this.name, this.phone, this.password);
}

class VerifyOtpEvent extends AuthEvent {
  final String otp;
  final String phone;
  final String name;
  final String password;

  VerifyOtpEvent(
    this.otp,
    this.phone,
    this.name,
    this.password,
  );
}

class AuthState {
  const AuthState();

  factory AuthState.init() {
    return const AuthState();
  }
}

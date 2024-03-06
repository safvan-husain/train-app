class AuthEvent {}

class AuthShowGoogle extends AuthEvent {}

class AuthState {
  const AuthState();

  factory AuthState.init() {
    return AuthState();
  }
}

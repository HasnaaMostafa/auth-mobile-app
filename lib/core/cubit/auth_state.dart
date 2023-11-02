part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final AuthModel authModel;
  RegisterSuccessState(this.authModel);
}

class RegisterErrorState extends AuthState {
  final String error;
  RegisterErrorState(this.error);
}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final AuthModel authModel;
  LoginSuccessState(this.authModel);
}

class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState(this.error);
}

class LogoutSuccessState extends AuthState {}

class ChangePasswordVisibilityStates extends AuthState {}

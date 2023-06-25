part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationStatusChanged extends AuthenticationEvent {
  final AuthenticationStatus status;

  AuthenticationStatusChanged({required this.status});
}

class LoginUser extends AuthenticationEvent {
  final String userName;

  final String password;

  final Function(String)? onError;

  LoginUser({required this.password, required this.userName, this.onError});
}

class CheckUser extends AuthenticationEvent {}

class RefreshToken extends AuthenticationEvent {}

class ChangeNotificationAllRead extends AuthenticationEvent {}

class LoginWithGoogle extends AuthenticationEvent {}

class LoginWithAppLe extends AuthenticationEvent {}

class LoginWithFaceBook extends AuthenticationEvent {}
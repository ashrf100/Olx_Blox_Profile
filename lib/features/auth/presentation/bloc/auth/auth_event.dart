part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String userName;
  final String password;
  final BuildContext context;

  LoginEvent({
    required this.userName,
    required this.password,
    required this.context,
  });
}

class GetCachedUserEvent extends AuthEvent {

}

class LogoutEvent extends AuthEvent {}

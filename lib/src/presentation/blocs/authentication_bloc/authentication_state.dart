import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class SignInInProgress extends AuthenticationState {}

class SignInSuccess extends AuthenticationState {}

class SignInFailed extends AuthenticationState {
  final String message;

  SignInFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class SignUpInProgress extends AuthenticationState {}

class SignUpSuccess extends AuthenticationState {}

class SignUpFailed extends AuthenticationState {
  final String message;

  SignUpFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class SignOutSuccess extends AuthenticationState {}

class SignOutFailed extends AuthenticationState {
  final String message;

  SignOutFailed({required this.message});

  @override
  List<Object> get props => [message];
}

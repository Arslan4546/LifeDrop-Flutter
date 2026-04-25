import 'package:equatable/equatable.dart';
import 'package:life_drop/data/models/user_model/user_model.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  final String role;

  AuthInitial({this.role = 'Donor'});
  @override
  List<Object?> get props => [role];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSuccess extends AuthState {
  final UserModel user;

  AuthSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

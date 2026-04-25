import 'package:equatable/equatable.dart';
import 'package:life_drop/data/models/user_model/user_model.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeRoleEvent extends AuthEvent {
  final String role;

  ChangeRoleEvent(this.role);

  @override
  List<Object?> get props => [role];
}

class RegisterEvent extends AuthEvent {
  final UserModel user;
  final String password;

  RegisterEvent(this.user, this.password);

  @override
  List<Object?> get props => [user, password];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

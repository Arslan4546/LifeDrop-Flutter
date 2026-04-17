import 'package:life_drop/data/models/user_model/user_model.dart';

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final UserModel user;
  final String password;

  RegisterEvent(this.user, this.password);
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

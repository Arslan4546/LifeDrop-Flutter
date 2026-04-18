import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/data/repositries/auth_repo.dart/auth_repo.dart';
import 'package:life_drop/viewmodels/auth_viewmodel/auth_bloc/auth_event.dart';
import 'package:life_drop/viewmodels/auth_viewmodel/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<ChangeRoleEvent>(_changeRole);
    on<RegisterEvent>(_register);
    on<LoginEvent>(_login);
  }

  Future<void> _changeRole(
    ChangeRoleEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthInitial(role: event.role));
  }

  Future<void> _register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.registerUser(
        event.user,
        event.password,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.loginUser(event.email, event.password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}

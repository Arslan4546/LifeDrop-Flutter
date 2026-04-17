import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life_drop/data/repositries/auth_repo.dart/auth_repo.dart';
import 'package:life_drop/viewmodels/auth_viewmodel/auth_bloc/auth_event.dart';
import 'package:life_drop/viewmodels/auth_viewmodel/auth_bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async {
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
    });

    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.loginUser(
          event.email,
          event.password,
        );
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}

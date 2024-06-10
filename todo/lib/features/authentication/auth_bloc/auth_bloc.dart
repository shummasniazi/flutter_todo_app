import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/local_storage.dart';
import '../../../network/repositories/todo_repository/api_imp.dart';
import '../models/request/user_profile_request.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Repository repository;
  final LocalStorage localStorage;

  AuthBloc(this.repository, this.localStorage) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await repository.loginUser(event.username, event.password);
        await localStorage.saveToken(user.token);
        await localStorage.saveRefreshToken(user.refreshToken);
        emit(AuthAuthenticated(user));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<CheckAuthEvent>((event, emit) async {
      final token = await localStorage.getToken();
      if (token != null) {
        try {
          final user = await repository.getCurrentAuthUser(token);
          emit(AuthAuthenticated(user));
        } catch (e) {
          emit(AuthError(e.toString()));
        }
      } else {
        emit(AuthInitial());
      }
    });

    on<LogoutEvent>((event, emit) async {
      await localStorage.clear();
      emit(AuthInitial());
    });
  }
}

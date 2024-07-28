import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:olx_bloc/core/error/failures_msg.dart';
import 'package:olx_bloc/features/auth/domain/entities/user.dart';
import 'package:olx_bloc/features/auth/domain/usecase/auth_usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogInUseCase logInUseCase;
  final GetCachedUserUseCase getCachedUserUseCase;
  final LogoutUseCase logoutUseCase;
  User? appUser;

  AuthBloc(
      {required this.logoutUseCase,
      required this.logInUseCase,
      required this.getCachedUserUseCase})
      : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoadingState());

      final failureOrUser = await logInUseCase(
          userName: event.userName, password: event.password);

      failureOrUser.fold(
        (failure) => emit(
            LoginErorrState(msg: mapFailureToMessage(failure, event.context))),
        (user) {
          appUser = user;
          emit(LoginSuccessState());
        },
      );
    });

    on<GetCachedUserEvent>((event, emit) async {
      final failureOrUser = await getCachedUserUseCase();

      failureOrUser.fold(
        (failure) => emit(LoginErorrState(msg: "")),
        (user) {
          appUser = user;
          emit(LoginSuccessState());
        },
      );
    });

    on<LogoutEvent>((event, emit) async {
      await logoutUseCase();
      emit(LoginErorrState(msg: " Good Bye :)  "));
    });
  }
}

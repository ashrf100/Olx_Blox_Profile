import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/login/login_widget.dart';

part 'auth_control_state.dart';

class AuthControlCubit extends Cubit<AuthControlInitial> {
  AuthControlCubit()
      : super(const AuthControlInitial(initWidget: LoginWidget()));

  changeInitWidget(Widget initWidget) {
    emit(AuthControlInitial(initWidget: initWidget));
  }
}

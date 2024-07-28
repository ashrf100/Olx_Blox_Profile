import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_button_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/login/login_widget.dart';

import 'package:olx_bloc/generated/l10n.dart';

class LoginButtonHelper extends StatelessWidget {
  const LoginButtonHelper({
    super.key,
    required this.formKey,
    required this.username,
    required this.password,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController username;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return SizedBox(width: 150.w, child: AppLoadingWidget(size: 30.sp));
        } else {
          return SizedBox(
            width: 150.w,
            child: AuthButtonWidget(
              text: S.of(context).login,
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                      userName: username.text,
                      password: password.text,
                      context: context));
                }
              },
            ),
          );
        }
      },
    );
  }
}

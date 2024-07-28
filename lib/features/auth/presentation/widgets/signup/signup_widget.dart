import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth_control/auth_control_cubit.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_Title_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_button_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/login/login_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/signup/signup_textfields_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController confirmPassword;

  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    email.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTitleWidget(text: S.of(context).SIGNUP),
        SignUpTextFieldsWidget(
            userC: username,
            emailC: email,
            passC: password,
            cPassC: confirmPassword,
            formKey: formKey),
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AuthButtonWidget(
                text: S.of(context).SIGNUP,
                onPressed: () {
                  onSignupTap(context);
                }),
            AuthButtonWidget(
                text: S.of(context).login,
                onPressed: () {
                  onLoginTap(context);
                })
          ],
        )
      ],
    );
  }

  void onLoginTap(BuildContext context) {
    context.read<AuthControlCubit>().changeInitWidget(const LoginWidget());
  }

  void onSignupTap(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      showSnackbar(
          context: context,
          message: S.of(context).WeApologizeSignupisCurrentlyDisabled,
          isSuccess: false);

      onLoginTap(context);
    }
  }
}

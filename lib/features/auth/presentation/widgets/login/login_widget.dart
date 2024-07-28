import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart%20';

import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth_control/auth_control_cubit.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/login/auth_social_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/login/test_user_button.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/signup/signup_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_Title_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_button_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/login/forgetpass_button.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/login/login_button_helper.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/login/login_textfields_widget.dart';

import 'package:olx_bloc/generated/l10n.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        onListener(state, context);
      },
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            AuthTitleWidget(text: S.of(context).login),
            TestUserButton(username: username, password: password)
          ]),
          LoginTextFieldsWidget(
              userC: username, passC: password, formKey: formKey),
          const ForgetPassButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LoginButtonHelper(
                  formKey: formKey, username: username, password: password),
              AuthButtonWidget(
                text: S.of(context).SIGNUP,
                onPressed: () {
                  onSignupTap(context);
                },
              )
            ],
          ),
          //  const AuthSocialWidget()
        ],
      ),
    );
  }

  void onSignupTap(BuildContext context) {
    context.read<AuthControlCubit>().changeInitWidget(
          const SignUpWidget(),
        );
  }

  void onListener(AuthState state, BuildContext context) {
    if (state is LoginErorrState) {
      showSnackbar(context: context, message: state.msg, isSuccess: false);
    } else if (state is LoginSuccessState) {
      TapHelper.navigateToMainPage(context);
    }
  }
}

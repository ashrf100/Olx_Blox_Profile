import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth_control/auth_control_cubit.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/forgetpass/check_otp_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_Title_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_button_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_text_Form_field.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/signup/signup_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class CheckEmailWidget extends StatefulWidget {
  const CheckEmailWidget({super.key});

  @override
  _CheckEmailWidgetState createState() => _CheckEmailWidgetState();
}

class _CheckEmailWidgetState extends State<CheckEmailWidget> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTitleWidget(text: S.of(context).ForgetPassword),
        SizedBox(height: 15.h),
        BounceInDown(
          duration: const Duration(seconds: 1),
          child: AuthTextFormField(
            controller: emailController,
            label: S.of(context).email.toUpperCase(),
            hint: S.of(context).EnteryourUseremail,
            icon: Icons.email_outlined,
          ),
        ),
        SizedBox(height: 15.h),
        AuthButtonWidget(
          onPressed: onCheckEmail,
          text: S.of(context).Submit,
        ),
      ],
    );
  }

  void onCheckEmail() {
    final validationError = _validateFields(context);
    if (validationError.isEmpty) {
      context.read<AuthControlCubit>().changeInitWidget(const CheckOTPWidget());
    } else {
      showSnackbar(
          context: context, message: validationError, isSuccess: false);
    }
  }

  String _validateFields(BuildContext context) {
    return emailController.text.isEmpty ? S.of(context).emailIsRequired : '';
  }
}

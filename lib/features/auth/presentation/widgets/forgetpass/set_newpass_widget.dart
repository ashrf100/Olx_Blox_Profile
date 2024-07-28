import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth_control/auth_control_cubit.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/login/login_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_Title_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_button_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_text_Form_field.dart';
import 'package:olx_bloc/generated/l10n.dart';

class SetNewPasswordWidget extends StatefulWidget {
  const SetNewPasswordWidget({super.key});

  @override
  _SetNewPasswordWidgetState createState() => _SetNewPasswordWidgetState();
}

class _SetNewPasswordWidgetState extends State<SetNewPasswordWidget> {
  late TextEditingController newPasswordController;
  late TextEditingController confirmNewPasswordController;

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTitleWidget(
          text: S.of(context).ForgetPassword,
        ),
        SizedBox(height: 15.h),
        BounceInLeft(
          duration: const Duration(seconds: 1),
          child: AuthTextFormField(
            controller: newPasswordController,
            label: S.of(context).newpassword,
            hint: S.of(context).EnteryourUserPassword,
            icon: Icons.lock_outline,
            obscure: true,
          ),
        ),
        SizedBox(height: 15.h),
        BounceInRight(
          duration: const Duration(seconds: 1),
          child: AuthTextFormField(
            controller: confirmNewPasswordController,
            label: S.of(context).confirmnewpassword,
            hint: S.of(context).confirmnewpassword,
            icon: Icons.lock_outline,
            obscure: true,
          ),
        ),
        SizedBox(height: 15.h),
        AuthButtonWidget(
          onPressed: onSetNewPassword,
          text: S.of(context).SaveNewPassword,
        ),
      ],
    );
  }

  void onSetNewPassword() {
    setState(() {
      final validationError = _validateFields(context);
      if (validationError.isEmpty) {
        context.read<AuthControlCubit>().changeInitWidget(const LoginWidget());

        showSnackbar(
            context: context,
            message: S.of(context).WeApologizeSignupisCurrentlyDisabled,
            isSuccess: false);
      } else {
        showSnackbar(
            context: context, message: validationError, isSuccess: false);
      }
    });
  }

  String _validateFields(BuildContext context) {
    if (newPasswordController.text.isEmpty) {
      return S.of(context).newPasswordIsRequired;
    } else if (confirmNewPasswordController.text.isEmpty) {
      return S.of(context).confirmNewPasswordIsRequired;
    } else if (newPasswordController.text !=
        confirmNewPasswordController.text) {
      return S.of(context).passwordsDoNotMatch;
    }
    return '';
  }
}

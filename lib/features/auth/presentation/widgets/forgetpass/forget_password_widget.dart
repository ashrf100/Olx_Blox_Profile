/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth_control/auth_control_cubit.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_text_Form_field.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/login/login_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class ForgetPasswidget extends StatefulWidget {
  const ForgetPasswidget({Key? key}) : super(key: key);

  @override
  _ForgetPasswidgetState createState() => _ForgetPasswidgetState();
}

class _ForgetPasswidgetState extends State<ForgetPasswidget> {
  late TextEditingController emailController;
  late TextEditingController otpController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmNewPasswordController;

  int forgetPasswordStep = 1; // 1: Email, 2: OTP, 3: New Password

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    otpController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTitle(context),
        if (forgetPasswordStep == 1) ...[
          buildAuthTextFormField(
            controller: emailController,
            label: S.of(context).email,
            hint: S.of(context).EnteryourUseremail,
            icon: Icons.email_outlined,
            obscure: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildCheckEmailButton(context),
            ],
          )
        ],
        if (forgetPasswordStep == 2) ...[
          buildAuthTextFormField(
            controller: otpController,
            label: 'otp',
            hint: S.of(context).EntertheOTPcode,
            icon: Icons.security_outlined,
            obscure: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [buildCheckOtpButton(context)],
          )
        ],
        if (forgetPasswordStep == 3) ...[
          buildAuthTextFormField(
            controller: newPasswordController,
            label: S.of(context).newpassword,
            hint: S.of(context).EnteryourUserPassword,
            icon: Icons.lock_outline,
            obscure: true,
          ),
          buildAuthTextFormField(
            controller: confirmNewPasswordController,
            label: S.of(context).confirmnewpassword,
            hint: S.of(context).confirmnewpassword,
            icon: Icons.lock_outline,
            obscure: true,
          ),
          buildNewPasswordButton(context),
        ],
      ],
    );
  }

  Padding buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0.w),
      child: Center(
        child: Text(
          S.of(context).ResetPassword.toUpperCase(),
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: AppColors.primaryVariant, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  AuthTextFormField buildAuthTextFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required bool obscure,
  }) {
    return AuthTextFormField(
      controller: controller,
      label: label.toUpperCase(),
      hint: hint,
      icon: icon,
      obscure: obscure,
      onTap: () {},
      validator: (value) =>
          value?.isEmpty ?? true ? "${S.of(context).isrequired} $label" : null,
    );
  }

  Widget buildCheckEmailButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
      child: MaterialButton(
        minWidth: 250.w,
        color: AppColors.primary,
        onPressed: () {
          setState(() {
            final validationError = _validateFields(context);
            if (validationError.isEmpty) {
              forgetPasswordStep = 2; // or 3 depending on the step
            } else {
              showSnackbar(context, validationError, false);
            }
          });
        },
        child: buildButtonText(
            context, S.of(context).Submit, AppColors.primaryVariant),
      ),
    );
  }

  Widget buildBackButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      child: MaterialButton(
        color: AppColors.primary,
        onPressed: () {
          setState(() {
            if (forgetPasswordStep == 1) {
              context
                  .read<AuthControlCubit>()
                  .changeInitWidget(const LoginWidget());
            } else if (forgetPasswordStep == 2) {
              setState(() {
                forgetPasswordStep = 1;
              });
            } else if (forgetPasswordStep == 3) {
              setState(() {
                forgetPasswordStep = 2;
              });
            }
          });
        },
        child: buildButtonText(
            context, S.of(context).back, AppColors.primaryVariant),
      ),
    );
  }

  Widget buildCheckOtpButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      child: MaterialButton(
        minWidth: 250.w,
        color: AppColors.primary,
        onPressed: () {
          setState(() {
            final validationError = _validateFields(context);
            if (validationError.isEmpty) {
              forgetPasswordStep = 3; // or 3 depending on the step
            } else {
              showSnackbar(context, validationError, false);
            }
          });
        },
        child: buildButtonText(
            context, S.of(context).Submit, AppColors.primaryVariant),
      ),
    );
  }

  Widget buildNewPasswordButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      child: MaterialButton(
        color: AppColors.primary,
        onPressed: () {
          setState(() {
            final validationError = _validateFields(context);
            if (validationError.isEmpty) {
              context
                  .read<AuthControlCubit>()
                  .changeInitWidget(const LoginWidget());
              showSnackbar(context, S.of(context).PasswordHasChanged, true);
            } else {
              showSnackbar(context, validationError, false);
            }
          });
        },
        child: buildButtonText(
            context, S.of(context).SaveNewPassword, AppColors.primaryVariant),
      ),
    );
  }

  Text buildButtonText(BuildContext context, String text, Color color) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: color, fontWeight: FontWeight.w600),
    );
  }

  String _validateFields(BuildContext context) {
    if (forgetPasswordStep == 1) {
      return emailController.text.isEmpty ? S.of(context).emailIsRequired : '';
    } else if (forgetPasswordStep == 2) {
      return otpController.text.isEmpty ? S.of(context).otpCodeIsRequired : '';
    } else if (forgetPasswordStep == 3) {
      if (newPasswordController.text.isEmpty) {
        return S.of(context).newPasswordIsRequired;
      } else if (confirmNewPasswordController.text.isEmpty) {
        return S.of(context).confirmNewPasswordIsRequired;
      } else if (newPasswordController.text !=
          confirmNewPasswordController.text) {
        return S.of(context).passwordsDoNotMatch;
      }
    }
    return '';
  }
}
*/
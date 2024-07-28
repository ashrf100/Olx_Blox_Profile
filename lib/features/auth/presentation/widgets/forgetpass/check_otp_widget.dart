import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth_control/auth_control_cubit.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/forgetpass/set_newpass_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_Title_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_button_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_text_Form_field.dart';
import 'package:olx_bloc/generated/l10n.dart';

class CheckOTPWidget extends StatefulWidget {
  const CheckOTPWidget({super.key});

  @override
  _CheckOTPWidgetState createState() => _CheckOTPWidgetState();
}

class _CheckOTPWidgetState extends State<CheckOTPWidget> {
  late TextEditingController otpController;

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    otpController.dispose();
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
        BounceInDown(
          duration: const Duration(seconds: 1),
          child: AuthTextFormField(
            controller: otpController,
            label: 'OTP',
            hint: S.of(context).EntertheOTPcode,
            icon: Icons.security_outlined,
          ),
        ),
        SizedBox(height: 15.h),
        AuthButtonWidget(
          onPressed: onCheckOTP,
          text: S.of(context).Submit,
        ),
      ],
    );
  }

  void onCheckOTP() {
    final validationError = _validateFields(context);
    if (validationError.isEmpty) {
      context
          .read<AuthControlCubit>()
          .changeInitWidget(const SetNewPasswordWidget());
    } else {
      showSnackbar(
          context: context, message: validationError, isSuccess: false);
    }
  }

  String _validateFields(BuildContext context) {
    return otpController.text.isEmpty ? S.of(context).otpCodeIsRequired : '';
  }
}

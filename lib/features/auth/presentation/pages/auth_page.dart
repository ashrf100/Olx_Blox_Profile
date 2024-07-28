import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/widgets/exit_dialog_widget.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth_control/auth_control_cubit.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/lang_button_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/login/login_widget.dart';
import 'package:olx_bloc/features/main/presentation/widgets/animated_logo_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return onAuthWillPop(context);
      },
      child: Scaffold(
        body: Container(
          color: AppColors.primaryDark,
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const LangButtonWidget(),
              AnimatedLogoWidget(cw: 450.w, ch: 250.h, lw: 150.w, lh: 150.h),
              context.select((AuthControlCubit a) => a.state.initWidget)
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildLinearGradient() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          AppColors.primaryDark,
          AppColors.primaryDark,
          AppColors.primaryDark,
          AppColors.primaryDark,
          AppColors.primaryDark,
        ]));
  }

  Future<bool> onAuthWillPop(BuildContext context) {
    final initWidget = context.read<AuthControlCubit>().state.initWidget;
    if (initWidget != const LoginWidget()) {
      return Future.value(context
          .read<AuthControlCubit>()
          .changeInitWidget(const LoginWidget()));
    } else {
      return showExitDialog(context, "Are You Sure You Want Exit ??", () {
        Navigator.pop(context);
      });
    }
  }

  showExitDialog(
      BuildContext context, String text, void Function()? onPressed) async {
    return await showDialog(
          context: context,
          builder: (context) => ExitDialogWidget(
            text: text,
            onPressed: onPressed,
          ),
        ) ??
        false;
  }
}

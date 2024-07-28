import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:olx_bloc/features/main/presentation/widgets/animated_logo_widget.dart';
import 'package:olx_bloc/features/main/presentation/widgets/app_version_info.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is LoginSuccessState) {
          await Future.delayed(const Duration(seconds: 3)).then((value) {
            TapHelper.navigateToMainPage(context);
          });
        } else if (state is LoginErorrState) {
          await Future.delayed(const Duration(seconds: 3)).then((value) {
            TapHelper.navigateToLandingPage(context);
          });
        }
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: AppColors.primaryDark,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: AnimatedLogoWidget(
                    cw: 350.w, ch: 350.h, lw: 200.w, lh: 200.h),
              ),
              const AppVersionInfo(),
              SizedBox(height: 40.h)
            ],
          ),
        ),
      ),
    );
  }
}

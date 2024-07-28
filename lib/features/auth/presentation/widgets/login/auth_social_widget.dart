import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/assets.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';

import 'package:olx_bloc/generated/l10n.dart';

class AuthSocialWidget extends StatelessWidget {
  const AuthSocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(seconds: 1),
      delay: const Duration(seconds: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildSocialButton(AppAssets.facebook, context),
          buildSocialButton(AppAssets.google, context),
          buildSocialButton(AppAssets.apple, context),
        ],
      ),
    );
  }

  GestureDetector buildSocialButton(String assetPath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSnackbar(
            context: context,
            message: S.of(context).WeApologizeSignupisCurrentlyDisabled,
            isSuccess: false);
      },
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Image.asset(
          assetPath,
          width: 25.w,
          height: 25.h,
        ),
      ),
    );
  }
}

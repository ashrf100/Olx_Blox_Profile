import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';

class AuthTitleWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;

  const AuthTitleWidget({
    Key? key,
    required this.text,
    this.fontSize = 24.0,
    this.textColor = AppColors.primaryVariant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Center(
        child: FadeIn(
          delay: const Duration(seconds: 1),
          duration: const Duration(seconds: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text.toUpperCase(),
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

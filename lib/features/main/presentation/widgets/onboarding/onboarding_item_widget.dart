import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/assets.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_button_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/lang_button_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class OnboardingItemWidget extends StatelessWidget {
  final String text;
  final String img;

  const OnboardingItemWidget({
    Key? key,
    required this.text,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 500),
      child: Column(
        children: [
          Image.asset(
            img,
            fit: BoxFit.fill,
            width: 300.w,
            height: 300.h,
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0.w),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.primaryVariant,
                      fontWeight: FontWeight.w500,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

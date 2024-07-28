import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/header_widget.dart';

class MapsButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const MapsButtonWidget(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0.w),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0.r),
        ),
        minWidth: 200.w,
        splashColor: AppColors.primaryLight,
        highlightColor: AppColors.primaryLight,
        height: 50.h,
        color: AppColors.primary,
        onPressed: onPressed,
        child: HeaderWidget(
          text: text,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/assets.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_button_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/lang_button_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class PageIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const PageIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.pageCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          height: 8.h,
          width: currentPage == index ? 20.w : 8.w,
          decoration: BoxDecoration(
            color: currentPage == index
                ? AppColors.primaryVariant
                : AppColors.primaryLight,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/localizations/presentation/widgets/lang_bottom_sheet.dart';

class LangButtonWidget extends StatelessWidget {
  const LangButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showLanguageBottomSheet(context);
      },
      child: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 20.w, top: 10.h),
          child: FadeIn(
            delay: const Duration(seconds: 2),
            child: Icon(
              Icons.language_rounded,
              size: 25.sp,
              color: AppColors.primaryVariant,
            ),
          )),
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        barrierColor: AppColors.primaryDark.withOpacity(0.9),
        context: context,
        builder: (context) => const LanguageBottomSheet());
  }
}

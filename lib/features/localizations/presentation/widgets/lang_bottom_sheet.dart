import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/assets.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/localizations/presentation/cubit/local_cubit.dart';
import 'package:olx_bloc/generated/l10n.dart';

class LanguageBottomSheet extends StatelessWidget {
  final bool isHome;

  const LanguageBottomSheet({super.key, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.8.r),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0.r),
          topRight: Radius.circular(20.0.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Center(
            child: Text(
              S.of(context).SelectYourLanguage,
              style: TextStyle(
                color: AppColors.primaryVariant,
                fontSize: 18.sp,
                height: 1.h,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          buildLanguageTile(
              context, "ar", AppAssets.arabicFlag, S.of(context).Arabic),
          SizedBox(height: 10.h),
          buildLanguageTile(
              context, "en", AppAssets.englishFlag, S.of(context).English),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  ListTile buildLanguageTile(BuildContext context, String languageCode,
      String imagePath, String language) {
    return ListTile(
      splashColor: AppColors.primaryLight,
      leading: Image.asset(imagePath),
      title: Text(
        language.toUpperCase(),
        style: TextStyle(
          color: AppColors.primaryVariant,
          fontSize: 16.sp,
          height: 1.h,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        isHome ? TapHelper.navigateToMainPage(context) : null;
        BlocProvider.of<LocalCubit>(context).changeLanguage(languageCode);
      },
    );
  }
}

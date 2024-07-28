import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart%20';
import 'package:olx_bloc/core/const/colors.dart';

class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primaryLight,
      primaryColorDark: AppColors.primaryDark,
      canvasColor: AppColors.primaryDark,
      scaffoldBackgroundColor: AppColors.primaryVariant,
      cardColor: AppColors.primaryVariant,
      dividerColor: AppColors.primary,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      unselectedWidgetColor: AppColors.primary,
      disabledColor: AppColors.primary,
      secondaryHeaderColor: AppColors.primaryDark,
      dialogBackgroundColor: AppColors.primaryVariant,
      indicatorColor: AppColors.primary,
      hintColor: AppColors.primary,
      fontFamily: 'Cairo',
      textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 24.sp),
        bodyLarge: TextStyle(fontSize: 18.sp),
        bodyMedium: TextStyle(fontSize: 16.sp),
        bodySmall: TextStyle(fontSize: 14.sp),
        labelMedium: TextStyle(fontSize: 12.sp),
        labelSmall: TextStyle(fontSize: 10.sp),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primary,
        selectionHandleColor: AppColors.primary,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.primary,
      ),
    );
  }

  static ThemeData themeDataAR() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      primaryColorLight: AppColors.primaryLight,
      primaryColorDark: AppColors.primaryDark,
      canvasColor: AppColors.primaryDark,
      scaffoldBackgroundColor: AppColors.primaryVariant,
      cardColor: AppColors.primaryVariant,
      dividerColor: AppColors.primary,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      unselectedWidgetColor: AppColors.primary,
      disabledColor: AppColors.primary,
      secondaryHeaderColor: AppColors.primaryDark,
      dialogBackgroundColor: AppColors.primaryVariant,
      indicatorColor: AppColors.primary,
      hintColor: AppColors.primary,
      fontFamily: 'Cairo',
      textTheme: TextTheme(
        headlineLarge: TextStyle(fontSize: 24.sp),
        bodyLarge: TextStyle(fontSize: 18.sp),
        bodyMedium: TextStyle(fontSize: 16.sp),
        bodySmall: TextStyle(fontSize: 14.sp),
        labelMedium: TextStyle(fontSize: 12.sp),
        labelSmall: TextStyle(fontSize: 10.sp),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primary,
        selectionHandleColor: AppColors.primary,
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.primary,
      ),
    );
  }
}

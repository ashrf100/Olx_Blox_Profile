import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/assets.dart';
import 'package:olx_bloc/core/const/strings.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.0.w),
      child: ZoomIn(
          delay: const Duration(seconds: 1),
          duration: const Duration(seconds: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10.w),
              Hero(
                tag: AppKeys.LOGO_TAG,
                child: Image.asset(
                  AppAssets.logo,
                  fit: BoxFit.cover,
                  width: 70.w,
                ),
              ),
            ],
          )),
    );
  }
}

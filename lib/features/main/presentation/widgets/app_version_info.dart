import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/generated/l10n.dart';

class AppVersionInfo extends StatelessWidget {
  const AppVersionInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LoadingAnimationWidget.hexagonDots(
          color: AppColors.primaryVariant,
          size: 40,
        ),
        SizedBox(height: 20.h),
        Text(S.of(context).version,
            softWrap: true,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.primaryVariant))
      ],
    );
  }
}

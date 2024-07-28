import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart ';
import 'package:olx_bloc/core/const/colors.dart';

class HeaderWidget extends StatelessWidget {
  final String text;
  final Color color;
  final MainAxisAlignment mainAxisAlignment;

  const HeaderWidget({
    Key? key,
    required this.text,
    this.color = AppColors.primaryVariant,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: color,
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
      ],
    );
  }
}

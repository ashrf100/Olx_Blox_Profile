import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart ';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/generated/l10n.dart';

class SeeAllButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  const SeeAllButtonWidget({
    Key? key,
    required this.onTap,
    this.color = AppColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 200.w,
        child: Text(
          S.of(context).Seeall,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color),
        ),
      ),
    );
  }
}

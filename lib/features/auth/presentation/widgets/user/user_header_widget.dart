import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart ';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/auth/domain/entities/user.dart';

class UserPageHeaderWidget extends StatelessWidget {
  final User user;
  const UserPageHeaderWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Text(
                user.firstName.toString()[0],
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    height: 1.h,
                    color: AppColors.primaryLight,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      user.firstName.toString().toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(height: 1.h, color: AppColors.primary),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      user.lastName.toString().toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(height: 1.h, color: AppColors.primary),
                    ),
                  ],
                ),
                Text(
                  user.email.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(height: 1.h, color: AppColors.primaryDark),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

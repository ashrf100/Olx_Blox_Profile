import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart ';
import 'package:olx_bloc/core/const/colors.dart';

class UserPageSettingsWidget extends StatefulWidget {
  const UserPageSettingsWidget({super.key});

  @override
  State<UserPageSettingsWidget> createState() => _UserPageSettingsWidgetState();
}

class _UserPageSettingsWidgetState extends State<UserPageSettingsWidget> {
  bool darkMode = false;
  bool enableNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          activeColor: AppColors.primary,
          title: Text('Dark Mode',
              style: TextStyle(
                color: AppColors.primaryDark,
                fontSize: 16.sp,
                height: 1.h,
              )),
          value: darkMode,
          onChanged: (value) {
            setState(() {
              darkMode = value;
            });
          },
        ),
        SwitchListTile(
          activeColor: AppColors.primary,
          title: Text('Enable Notifications',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(height: 1.h, color: AppColors.primaryDark)),
          value: enableNotifications,
          onChanged: (value) {
            setState(() {
              enableNotifications = value;
            });
          },
        )
      ],
    );
  }
}

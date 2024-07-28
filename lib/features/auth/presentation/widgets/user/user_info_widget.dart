import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart ';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/localizations/presentation/widgets/lang_bottom_sheet.dart';
import 'package:olx_bloc/generated/l10n.dart';

// ignore: must_be_immutable
class UserPageInfoWidget extends StatelessWidget {
  const UserPageInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _userListTile(context, S.of(context).ViewLocations, () {
          TapHelper.navigateToMapsOrLocation(context);
        }),
        _userListTile(context, S.of(context).ChangePassword, () {
          showSnackbarMethod(context);
        }),
        _userListTile(context, S.of(context).ChangeEmail, () {
          showSnackbarMethod(context);
        }),
        _userListTile(context, S.of(context).ChangeLanguage, () {
          showLangBottomSheetMethod(context);
        }),
      ],
    );
  }

  Future<dynamic> showLangBottomSheetMethod(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: AppColors.primaryDark.withOpacity(0.9),
      isDismissible: true,
      context: context,
      builder: (context) => const LanguageBottomSheet(isHome: true),
    );
  }

  void showSnackbarMethod(BuildContext context) {
    return showSnackbar(
        context: context,
        message: S.of(context).WeApologizeSignupisCurrentlyDisabled,
        isSuccess: false);
  }

  ListTile _userListTile(
      BuildContext context, String title, void Function()? onTap) {
    return ListTile(
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(height: 1.h, color: AppColors.primaryDark)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: AppColors.primary,
      ),
      onTap: onTap,
    );
  }
}

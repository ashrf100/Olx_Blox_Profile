import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart ';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/core/widgets/exit_dialog_widget.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/auth/domain/entities/user.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/user/user_header_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/user/user_info_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/user/user_settings_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = BlocProvider.of<AuthBloc>(context).appUser!;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginErorrState) {
          TapHelper.navigateToAuthPage(context);
        }
      },
      child: ListView(
        children: [
          UserPageHeaderWidget(user: user),
          SizedBox(height: 10.h),
          const UserPageInfoWidget(),
          SizedBox(height: 20.h),
          const UserPageSettingsWidget(),
          SizedBox(height: 20.h),
          buildLogout(context),
        ],
      ),
    );
  }

  ListTile buildLogout(BuildContext context) {
    return ListTile(
      title: Text(S.of(context).Logout,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(height: 1.h, color: AppColors.primaryDark)),
      trailing: const Icon(Icons.logout),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => ExitDialogWidget(
            text: S.of(context).AreyouSuretoLogout,
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
            },
          ),
        );
      },
    );
  }
}

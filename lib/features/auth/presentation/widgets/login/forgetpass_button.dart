import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx_bloc/core/const/colors.dart';

import 'package:olx_bloc/features/auth/presentation/bloc/auth_control/auth_control_cubit.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/forgetpass/check_Email_widget%20.dart';
import 'package:olx_bloc/generated/l10n.dart';

class ForgetPassButton extends StatelessWidget {
  const ForgetPassButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: const Duration(seconds: 1),
      duration: const Duration(seconds: 1),
      child: TextButton(
        onPressed: () {
          context
              .read<AuthControlCubit>()
              .changeInitWidget(const CheckEmailWidget());
        },
        child: Text(S.of(context).ForgetPassword,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.primary)),
      ),
    );
  }
}

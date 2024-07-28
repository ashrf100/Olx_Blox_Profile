import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_text_Form_field.dart';

import 'package:olx_bloc/generated/l10n.dart';

class LoginTextFieldsWidget extends StatelessWidget {
  final TextEditingController userC;
  final TextEditingController passC;
  final Key formKey;

  const LoginTextFieldsWidget({
    super.key,
    required this.userC,
    required this.passC,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          BounceInLeft(
            duration: const Duration(seconds: 1),
            child: AuthTextFormField(
              controller: userC,
              hint: S.of(context).EnteryourUserName,
              icon: Icons.email_outlined,
              label: S.of(context).username,
            ),
          ),
          SizedBox(height: 10.h),
          BounceInRight(
            duration: const Duration(seconds: 1),
            child: AuthTextFormField(
              controller: passC,
              hint: S.of(context).EnteryourUserPassword,
              icon: Icons.visibility_outlined,
              obscure: true,
              label: S.of(context).password,
            ),
          ),
        ],
      ),
    );
  }
}

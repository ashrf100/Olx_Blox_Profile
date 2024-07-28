import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_text_Form_field.dart';
import 'package:olx_bloc/generated/l10n.dart';

class SignUpTextFieldsWidget extends StatelessWidget {
  final TextEditingController userC;
  final TextEditingController emailC;
  final TextEditingController passC;
  final TextEditingController cPassC;
  final Key formKey;

  const SignUpTextFieldsWidget({
    Key? key,
    required this.userC,
    required this.emailC,
    required this.passC,
    required this.cPassC,
    required this.formKey,
  }) : super(key: key);

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
              label: S.of(context).username,
              hint: S.of(context).EnteryourUserName,
              icon: Icons.person_2_outlined,
            ),
          ),
          BounceInRight(
            duration: const Duration(seconds: 1),
            child: AuthTextFormField(
              controller: emailC,
              label: S.of(context).email,
              hint: S.of(context).EnteryourUseremail,
              icon: Icons.email_outlined,
            ),
          ),
          BounceInLeft(
            duration: const Duration(seconds: 1),
            child: AuthTextFormField(
              controller: passC,
              label: S.of(context).password,
              hint: S.of(context).EnteryourUserPassword,
              icon: Icons.visibility_outlined,
              obscure: true,
            ),
          ),
          BounceInRight(
            duration: const Duration(seconds: 1),
            child: AuthTextFormField(
              controller: cPassC,
              label: S.of(context).confirmpassword,
              hint: S.of(context).EnteryourUserPassword,
              icon: Icons.visibility_outlined,
              obscure: true,
            ),
          ),
        ],
      ),
    );
  }
}

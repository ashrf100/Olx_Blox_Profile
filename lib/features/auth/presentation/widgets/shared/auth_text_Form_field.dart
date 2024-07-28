import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart%20';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/generated/l10n.dart';

class AuthTextFormField extends StatefulWidget {
  final String? label;
  final String hint;
  final IconData icon;
  final bool obscure;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final String? errorText;

  const AuthTextFormField(
      {Key? key,
      required this.label,
      required this.hint,
      required this.icon,
      this.obscure = false,
      required this.controller,
      this.keyboardType,
      this.onTap,
      this.errorText})
      : super(key: key);

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

bool _obscureText = false;

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: TextFormField(
        key: ValueKey(widget.label),
        validator: (value) => value?.isEmpty ?? true
            ? "${S.of(context).isrequired} ${widget.label}"
            : null,
        obscureText: widget.obscure ? !_obscureText : widget.obscure,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: AppColors.primary, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          errorStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.error.withOpacity(0.9), height: 1.h),
          errorText: widget.errorText,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
          hintText: widget.hint,
          hintStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.primaryDark, height: 1.h),
          suffixIcon: InkWell(
            onTap: () {
              if (widget.obscure) {
                setState(() {
                  _obscureText = !_obscureText;
                });
              }
            },
            child: Icon(
              _obscureText ? Icons.visibility_off_outlined : widget.icon,
              color: AppColors.primary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: AppColors.primaryLight,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: AppColors.primaryLight,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: AppColors.primaryLight,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: AppColors.primaryVariant,
        ),
      ),
    );
  }
}

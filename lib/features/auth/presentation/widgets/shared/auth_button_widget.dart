import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:olx_bloc/core/const/colors.dart';

class AuthButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final Color textcolor;

  final double minWidth;
  final double height;

  const AuthButtonWidget(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color = AppColors.primary,
      this.minWidth = 150.0,
      this.height = 40.0,
      this.textcolor = AppColors.primaryVariant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: const Duration(seconds: 1),
      duration: const Duration(seconds: 1),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: minWidth,
        splashColor: AppColors.primaryLight,
        height: height,
        color: color,
        child: Text(text.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: textcolor, fontWeight: FontWeight.w500)),
      ),
    );
  }
}

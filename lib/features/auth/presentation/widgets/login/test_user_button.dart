import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';

class TestUserButton extends StatefulWidget {
  const TestUserButton({
    Key? key,
    required this.username,
    required this.password,
  }) : super(key: key);

  final TextEditingController username;
  final TextEditingController password;

  @override
  State<TestUserButton> createState() => _TestUserButtonState();
}

class _TestUserButtonState extends State<TestUserButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.7,
      duration: const Duration(seconds: 1),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _colorAnimation = TweenSequence<Color?>(
      [
        TweenSequenceItem(
          tween: ColorTween(
            begin: AppColors.primaryDark,
            end: AppColors.primaryVariant,
          ),
          weight: 2,
        ),
      ],
    ).animate(_controller);

    // Set up a repeating animation
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: const Duration(seconds: 1),
      duration: const Duration(seconds: 1),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                widget.username.text = 'stellah';
                widget.password.text = 'stellahpass';
              },
              icon: Icon(
                Icons.help_sharp,
                size: 25.sp,
                color: _colorAnimation.value ?? AppColors.primaryVariant,
              ),
            );
          },
        ),
      ),
    );
  }
}

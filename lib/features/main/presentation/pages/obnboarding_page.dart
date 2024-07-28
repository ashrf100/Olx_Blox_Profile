import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_button_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/lang_button_widget.dart';
import 'package:olx_bloc/features/main/presentation/widgets/onboarding/onboarding_dots_widgets.dart';
import 'package:olx_bloc/features/main/presentation/widgets/onboarding/onboarding_helper.dart';
import 'package:olx_bloc/generated/l10n.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  void _onPageChanged(int value) {
    setState(() {
      currentPage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const LangButtonWidget(),
      ),
      body: Column(
        children: [
          Expanded(
            child: OnboardingPageView(
              pageController: _pageController,
              onPageChanged: _onPageChanged,
            ),
          ),
          PageIndicatorWidget(
            currentPage: currentPage,
            pageCount: 3,
          ),
          SizedBox(height: 20.h),
          AuthButtonWidget(
            text:
                currentPage < 2 ? S.of(context).next : S.of(context).GetStarted,
            onPressed: () {
              _onPressedMethod();
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  void _onPressedMethod() {
    if (currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      TapHelper.navigateToAuthPage(context);
    }
  }
}

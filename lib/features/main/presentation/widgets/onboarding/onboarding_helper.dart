import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/assets.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/auth_button_widget.dart';
import 'package:olx_bloc/features/auth/presentation/widgets/shared/lang_button_widget.dart';
import 'package:olx_bloc/features/main/presentation/widgets/onboarding/onboarding_item_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  const OnboardingPageView({
    Key? key,
    required this.pageController,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> olxAppDescription = [
      S.of(context).onboarding1,
      S.of(context).onboarding2,
      S.of(context).onboarding3,
    ];

    List<String> olxAppImgs = [
      AppAssets.onboarding_2,
      AppAssets.onboarding_3,
      AppAssets.onboarding_1,
    ];

    return PageView.builder(
      controller: pageController,
      itemCount: 3,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return OnboardingItemWidget(
          text: olxAppDescription[index],
          img: olxAppImgs[index],
        );
      },
    );
  }
}

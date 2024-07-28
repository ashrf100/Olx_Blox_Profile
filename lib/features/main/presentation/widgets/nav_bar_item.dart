import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:olx_bloc/features/main/presentation/cubit/main_cubit.dart';
import 'package:badges/badges.dart' as badges;

class NavBarItem extends StatelessWidget {
  final int index;
  final IconData icon;
  final String title;
  final bool cart;
  final int selectedIndex;

  const NavBarItem(
      {Key? key,
      required this.index,
      required this.icon,
      required this.title,
      required this.cart,
      required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: InkWell(
        onTap: () => context.read<MainCubit>().selectTab(index),
        child: (cart)
            ? buildCartCount(context, selectedIndex)
            : SizedBox(
                width: 80.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    buildAnimatedHeader(selectedIndex),
                    buildIcon(context, selectedIndex),
                    buildTitle(context, selectedIndex),
                  ],
                ),
              ),
      ),
    );
  }

  buildTitle(BuildContext context, int? selectedIndex) {
    return FittedBox(
      child: Text(title.toUpperCase(),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: selectedIndex == index
                  ? AppColors.primaryLight
                  : AppColors.primaryVariant)),
    );
  }

  buildIcon(BuildContext context, int? selectedIndex) {
    return Padding(
      padding:
          EdgeInsets.only(top: 6.0.h, left: 6.0.w, right: 6.0.w, bottom: 1.h),
      child: Icon(icon,
          size: 25.sp,
          color: selectedIndex == index
              ? AppColors.primaryLight
              : AppColors.primaryVariant),
    );
  }

  AnimatedContainer buildAnimatedHeader(int? selectedIndex) {
    return AnimatedContainer(
      height: 5.h,
      width: 50.w,
      color: selectedIndex == index
          ? AppColors.primaryVariant
          : AppColors.primaryDark,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCirc,
    );
  }

  buildCartCount(BuildContext context, int selectedIndex) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        int cartItemsCount = BlocProvider.of<CartBloc>(context).cartItemsCount;

        if (state is CartInitState || state is AddToCartSuccessState) {
          cartItemsCount = BlocProvider.of<CartBloc>(context).cartItemsCount;
        }

        return badges.Badge(
          position: badges.BadgePosition.topEnd(top: -0, end: 5.w),
          showBadge: true,
          ignorePointer: false,
          onTap: () {},
          badgeContent: FittedBox(
            child: Text(
              cartItemsCount.toString(),
              softWrap: false,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.primaryVariant),
              textAlign: TextAlign.center,
            ),
          ),
          badgeAnimation: const badges.BadgeAnimation.rotation(
            animationDuration: Duration(seconds: 1),
            colorChangeAnimationDuration: Duration(seconds: 1),
            loopAnimation: false,
            curve: Curves.fastOutSlowIn,
            colorChangeAnimationCurve: Curves.easeInCubic,
          ),
          badgeStyle: const badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              badgeColor: AppColors.error,
              elevation: 1,
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildAnimatedHeader(selectedIndex),
              buildIcon(context, selectedIndex),
              buildTitle(context, selectedIndex),
            ],
          ),
        );
      },
    );
  }
}

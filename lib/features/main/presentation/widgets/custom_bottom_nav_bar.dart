import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/main/presentation/cubit/main_cubit.dart';
import 'package:olx_bloc/features/main/presentation/widgets/nav_bar_item.dart';
import 'package:olx_bloc/generated/l10n.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryDark,
      child: BlocBuilder<MainCubit, BottomNavBarState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <NavBarItem>[
              NavBarItem(
                index: 0,
                icon: selectedIndex == 0
                    ? Icons.storefront_rounded
                    : Icons.storefront_outlined,
                title: S.of(context).Home,
                cart: false,
                selectedIndex: selectedIndex,
              ),
              NavBarItem(
                index: 1,
                icon: selectedIndex == 1
                    ? Icons.shopping_bag_rounded
                    : Icons.shopping_bag_outlined,
                title: S.of(context).Products,
                cart: false,
                selectedIndex: selectedIndex,
              ),
              NavBarItem(
                index: 2,
                icon: selectedIndex == 2
                    ? Icons.account_circle_rounded
                    : Icons.account_circle_outlined,
                title: S.of(context).User,
                cart: false,
                selectedIndex: selectedIndex,
              ),
              NavBarItem(
                index: 3,
                icon: selectedIndex == 3
                    ? Icons.shopping_cart_rounded
                    : Icons.shopping_cart_outlined,
                title: S.of(context).Cart,
                cart: true,
                selectedIndex: selectedIndex,
              )
            ],
          );
        },
      ),
    );
  }
}

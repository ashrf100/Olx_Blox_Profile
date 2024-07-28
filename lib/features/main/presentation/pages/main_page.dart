import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx_bloc/features/auth/presentation/pages/user_page.dart';
import 'package:olx_bloc/features/cart/presentation/pages/cart_page.dart';
import 'package:olx_bloc/features/main/presentation/cubit/main_cubit.dart';
import 'package:olx_bloc/features/main/presentation/widgets/my_app_bar.dart';
import 'package:olx_bloc/features/maps/presentation/bloc/location/location_bloc.dart';
import 'package:olx_bloc/features/products/presentation/pages/home_page.dart';
import 'package:olx_bloc/features/products/presentation/pages/products_page.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class MainPage extends StatelessWidget {
  final List<Widget> _pages = [
    const HomePage(),
    const ProductsPage(),
    const UserPage(),
    const CartPage(),
  ];

  MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LocationBloc>(context).add(GetSavedLocationEvent());

    return Scaffold(
      appBar: MyAppBar(),
      body: IndexedStack(
          index: context.select((MainCubit m) => m.state.selectedIndex),
          children: _pages),
      bottomNavigationBar: CustomBottomNavBar(
          selectedIndex:
              context.select((MainCubit m) => m.state.selectedIndex)),
    );
  }
}

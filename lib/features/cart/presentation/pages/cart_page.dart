import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/cart/domain/entities/cart.dart';
import 'package:olx_bloc/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:olx_bloc/features/cart/presentation/widgets/Bill.dart';
import 'package:olx_bloc/features/cart/presentation/widgets/cart_items_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    _onstart(context);

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartInitState) {
          final Cart cart = state.cart;

          return RefreshIndicator(
            onRefresh: () => _onstart(context),
            child: Column(
              children: [
                CartItemsWidget(cart: cart),
                CartBillWidget(cart: cart)
              ],
            ),
          );
        } else if (state is CartloadingState) {
          return const AppLoadingWidget(size: 25);
        } else if (state is CartErorrState) {
          return AppErrorWidget(
              message: state.msg, onPressed: () => _onstart(context));
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Future<void> _onstart(BuildContext context) async {
    BlocProvider.of<CartBloc>(context).add(CartInitEvent(context: context));
  }
}

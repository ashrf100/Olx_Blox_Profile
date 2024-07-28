import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx_bloc/core/functions/on_cart_listener_func.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:olx_bloc/features/products/presentation/bloc/home/home_bloc.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/homepage_helper_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    _onstart(context);
    return BlocListener<CartBloc, CartState>(listener: (context, state) async {
      await onCartListener(state, context);
    }, child: BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is LoadingHomeState) {
          return const AppLoadingWidget();
        }
        if (state is ErrorHomeState) {
          return AppErrorWidget(
              message: state.msg, onPressed: () => _onstart(context));
        }
        if (state is InitHomeState) {
          return HomePageHelperWidget(
            products: state.products,
            categories: state.categories,
          );
        } else {
          return const SizedBox();
        }
      },
    ));
  }

  Future<void> _onstart(BuildContext context) async {
    BlocProvider.of<HomeBloc>(context).add(HomeInitEvent(context: context));
  }
}

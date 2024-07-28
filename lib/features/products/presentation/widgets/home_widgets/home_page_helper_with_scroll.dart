import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/bloc/home/home_bloc.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/best_product_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/flash_sale_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/hometop_container.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/suggested_products_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/today_offers_Widget.dart';

class HomePageHelperWithScroll extends StatelessWidget {
  final List<Product> products;
  final List<String> categories;
  final InitHomeState state;

  const HomePageHelperWithScroll({
    super.key,
    required this.products,
    required this.categories,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final List widgetsToShow = [
      HomeTopContainer(products: products, categories: categories),
      TodayOffersWidget(products: products),
      BestProductWidget(products: products, index: 49),
      FlashSaleWidget(products: products),
      BestProductWidget(products: products, index: 10),
      SuggestedProductsWidget(products: products),
      BestProductWidget(products: products, index: 9),
    ];

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        return _handleScrollNotification(
            scrollNotification, widgetsToShow, context);
      },
      child: ListView.builder(
        itemCount: state.widgetsLength,
        itemBuilder: (context, index) => widgetsToShow[index],
      ),
    );
  }

  bool _handleScrollNotification(ScrollNotification scrollNotification,
      List widgetsToShow, BuildContext context) {
    final maxScroll = scrollNotification.metrics.maxScrollExtent;
    final currentScroll = scrollNotification.metrics.pixels;
    final halfwayPoint = maxScroll / 2;
    if (widgetsToShow.length != state.widgetsLength) {
      if (scrollNotification is ScrollEndNotification &&
          currentScroll >= halfwayPoint) {
        context
            .read<HomeBloc>()
            .add(LoadNextSectionEvent(widgetsLength: widgetsToShow.length));
        return true;
      }
    }
    return false;
  }
}

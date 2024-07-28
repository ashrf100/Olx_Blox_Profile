import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/best_product_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/flash_sale_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/hometop_container.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/suggested_products_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/today_offers_Widget.dart';

import 'package:flutter/material.dart';

class HomePageHelperWidget extends StatelessWidget {
  final List<Product> products;
  final List<String> categories;
  const HomePageHelperWidget(
      {super.key, required this.products, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeTopContainer(products: products, categories: categories),
          TodayOffersWidget(products: products),
          BestProductWidget(products: products, index: 49),
          FlashSaleWidget(products: products),
          BestProductWidget(products: products, index: 10),
          SuggestedProductsWidget(products: products),
          BestProductWidget(products: products, index: 9),
        ],
      ),
    );
  }
}

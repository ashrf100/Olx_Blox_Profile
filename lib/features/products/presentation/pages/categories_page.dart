import 'package:flutter/material.dart';
import 'package:olx_bloc/features/main/presentation/widgets/my_app_bar.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/categories_bar_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class CategoriesPage extends StatelessWidget {
  final List<String> categoryName;
  final List<Product> products;
  const CategoriesPage(
      {super.key, required this.categoryName, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          MyAppBar(isCategory: true, categoryName: S.of(context).AllCategories),
      body: SafeArea(
          child: SingleChildScrollView(
        child: CategoriesBarWidget(
          isCategory: true,
          categoryName: categoryName,
          products: products,
        ),
      )),
    );
  }
}

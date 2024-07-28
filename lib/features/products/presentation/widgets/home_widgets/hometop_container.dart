import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/categories_bar_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/home_slider_widget.dart';

class HomeTopContainer extends StatelessWidget {
  final List<Product> products;
  final List<String> categories;

  const HomeTopContainer({
    super.key,
    required this.products,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      height: 500.h,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HomeSliderWidget(products: products),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CategoriesBarWidget(
              categoryName: categories,
              products: products,
            ),
          ),
        ],
      ),
    );
  }
}

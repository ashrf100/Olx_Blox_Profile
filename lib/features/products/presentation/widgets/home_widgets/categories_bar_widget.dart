import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/See_allButton_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/category_widget.dart';
import '../../../../../core/const/colors.dart';

class CategoriesBarWidget extends StatelessWidget {
  final List<String> categoryName;
  final List<Product> products;

  final bool isCategory;

  const CategoriesBarWidget(
      {Key? key,
      required this.categoryName,
      required this.products,
      this.isCategory = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Column(
        children: [
          isCategory
              ? _buildCategoriesGridView(context, categoryName, products)
              : ZoomIn(
                  delay: const Duration(milliseconds: 500),
                  duration: const Duration(milliseconds: 500),
                  child: _buildhomeCategoriesGridView(
                      context, categoryName, products)),
          SizedBox(height: 5.h),
          !isCategory
              ? SeeAllButtonWidget(
                  onTap: () => TapHelper.navigateToCategories(
                      context, categoryName, products),
                  color: AppColors.primaryVariant)
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _buildCategoriesGridView(
      BuildContext context, List<String> categoryName, List<Product> products) {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      childAspectRatio: 0.7.w,
      crossAxisCount: 2,
      mainAxisSpacing: 20.h,
      crossAxisSpacing: 5.w,
      children: List.generate(categoryName.length, (int index) {
        if (index * 5 >= products.length) {
          return Container();
        }
        return CategoryWidget(
          categoryName: categoryName[index],
          categoryImage: products[index * 5].thumbnail.toString(),
          onTap: () {
            TapHelper.navigateToSingleCategory(context, categoryName[index]);
          },
        );
      }),
    );
  }

  Widget _buildhomeCategoriesGridView(
      BuildContext context, List<String> categoryName, List<Product> products) {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      childAspectRatio: 0.8.w,
      crossAxisCount: 4,
      children: List.generate(8, (int index) {
        return CategoryWidget(
          categoryName: categoryName[index],
          categoryImage: products[index * 5].thumbnail.toString(),
          onTap: () {
            TapHelper.navigateToSingleCategory(context, categoryName[index]);
          },
        );
      }),
    );
  }
}

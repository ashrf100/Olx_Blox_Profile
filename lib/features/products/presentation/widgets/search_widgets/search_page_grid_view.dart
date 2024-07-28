import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart ';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/grid_product_widget.dart';

class SearchPageGridView extends StatelessWidget {
  final List<Product> products;
  const SearchPageGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5.w,
          crossAxisSpacing: 5.w,
          childAspectRatio: 0.7.w,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return InkWell(
              onTap: () {
                TapHelper.navigateToProductInfo(context, product);
              },
              child: GridProductWidget(
                  showButton: false,
                  onTap: () {
                    TapHelper.addToCart(context, product, 1);
                  },
                  product: product));
        },
      ),
    );
  }
}

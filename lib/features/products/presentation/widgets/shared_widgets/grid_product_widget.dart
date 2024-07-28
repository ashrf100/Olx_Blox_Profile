import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/list_product_widget.dart';

class GridProductWidget extends StatelessWidget {
  final Product product;
  final Function onTap;
  final bool showButton;
  final bool showBanner;
  final bool showRateAndCategore;

  const GridProductWidget(
      {Key? key,
      required this.product,
      required this.onTap,
      this.showButton = true,
      this.showBanner = true,
      this.showRateAndCategore = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              children: [
                ProductImage(product: product),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    ProductTitle(product: product),
                    SizedBox(height: 10.h),
                    ProductPricing(product: product),
                    SizedBox(height: 5.h),
                    showRateAndCategore
                        ? FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CategoryBadge(product: product),
                                SizedBox(width: 10.w),
                                RatingBadge(product: product)
                              ],
                            ),
                          )
                        : const SizedBox(),
                    SizedBox(height: 10.h),
                    showButton
                        ? AddToCartButton(product: product, onTap: onTap)
                        : const SizedBox()
                  ],
                ),
              ],
            ),
          ),
          if (showBanner)
            Positioned(top: 20.h, child: DiscountBanner(product: product)),
        ],
      ),
    );
  }
}

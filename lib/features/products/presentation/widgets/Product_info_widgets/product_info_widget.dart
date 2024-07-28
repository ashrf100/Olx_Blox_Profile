import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/list_product_widget.dart';

class ProductInfoWidget extends StatelessWidget {
  final Product product;

  const ProductInfoWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      margin: EdgeInsets.all(5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductTitle(context),
          SizedBox(height: 20.h),
          _buildDiscountInfo(context),
          SizedBox(height: 20.h),
          _buildProductDescription(context),
          const SizedBox(height: 10),
          _buildBadgesRow(),
        ],
      ),
    );
  }

  Widget _buildProductTitle(BuildContext context) {
    return Center(
      child: Text(
        product.title!.toUpperCase(),
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
            ),
      ),
    );
  }

  Widget _buildDiscountInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ProductPricing(product: product),
        DiscountBanner(product: product),
      ],
    );
  }

  Widget _buildProductDescription(BuildContext context) {
    return Text(
      product.description!,
      softWrap: true,
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: AppColors.primaryDark,
            height: 1.h,
            fontWeight: FontWeight.w600,
          ),
    );
  }

  Widget _buildBadgesRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CategoryBadge(product: product),
        SizedBox(width: 10.w),
        RatingBadge(product: product),
      ],
    );
  }
}

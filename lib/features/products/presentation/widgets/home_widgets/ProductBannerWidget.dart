import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/generated/l10n.dart';

class ProductBannerWidget extends StatelessWidget {
  const ProductBannerWidget({Key? key, required this.product, this.bottom})
      : super(key: key);

  final Product product;
  final double? bottom;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom ?? 50.h,
      left: 10.w,
      child: FadeIn(
        delay: const Duration(seconds: 1),
        child: Container(
            width: 200.w,
            height: 60.h,
            padding: EdgeInsets.all(4.w),
            color: AppColors.primary.withOpacity(0.7),
            child: Row(
              children: [
                _buildLeading(context),
                SizedBox(
                  width: 4.w,
                ),
                _buildTitle(context),
              ],
            )),
      ),
    );
  }

  Widget _buildLeading(BuildContext context) {
    return Container(
      color: AppColors.primaryLight,
      width: 50.w,
      height: 50.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).TOP,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.primary, fontWeight: FontWeight.w800),
          ),
          Text(
            "#1",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.primary, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 130.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              " ${product.title} ",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.primaryVariant, fontWeight: FontWeight.w800),
            ),
          ),
          Text(
            '${product.price}.00 US',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.primaryVariant,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

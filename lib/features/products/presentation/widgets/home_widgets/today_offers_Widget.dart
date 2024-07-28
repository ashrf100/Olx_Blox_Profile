import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart ';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/See_allButton_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/header_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/grid_product_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class TodayOffersWidget extends StatelessWidget {
  final List<Product> products;

  const TodayOffersWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary, AppColors.primaryVariant],
        ),
      ),
      child: Column(
        children: [
          HeaderWidget(text: S.of(context).TodayOffers),
          _buildOffersGrid(),
          SizedBox(height: 5.h),
          SeeAllButtonWidget(onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildOffersGrid() {
    return GridView.builder(
        itemCount: 4,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.h,
            mainAxisSpacing: 5.w,
            childAspectRatio: 0.6.w),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              TapHelper.navigateToProductInfo(context, products[index]);
            },
            child: GridProductWidget(
              onTap: () {
                TapHelper.addToCart(context, products[index], 1);
              },
              product: products[index],
            ),
          );
        });
  }
}

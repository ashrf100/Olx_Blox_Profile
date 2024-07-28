import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/header_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/list_product_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';
import '../../../../../core/const/colors.dart';

class SuggestedProductsWidget extends StatelessWidget {
  final List<Product> products;

  const SuggestedProductsWidget({Key? key, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.h),
      decoration: BoxDecoration(
        gradient: _buildLinearGradient(),
      ),
      child: Column(
        children: [
          HeaderWidget(text: S.of(context).SuggestedProducts),
          SizedBox(height: 5.h),
          _buildListView(products),
        ],
      ),
    );
  }

  LinearGradient _buildLinearGradient() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppColors.primary,
        AppColors.primaryVariant,
        AppColors.primaryVariant,
      ],
    );
  }

  Widget _buildListView(List<Product> products) {
    return ListView.builder(
      itemCount: 8,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            TapHelper.navigateToProductInfo(context, products[index]);
          },
          child: ListProductWidget(
            onTap: () {
              TapHelper.addToCart(context, products[index], 1);
            },
            product: products[index],
          ),
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.h),
          child: Text(
            "Suggested Products",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors.primaryVariant, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}

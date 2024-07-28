import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/ProductBannerWidget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/header_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/CustomCachedNetworkImage.dart';
import 'package:olx_bloc/generated/l10n.dart';

class BestProductWidget extends StatelessWidget {
  final List<Product> products;
  final int index;

  const BestProductWidget({
    Key? key,
    required this.products,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
            color: AppColors.primary,
            text: " ${S.of(context).TopSelles} | ${products[index].category} "),
        _buildProductCard(context),
        SizedBox(height: 10.h),
      ],
    );
  }

  Widget _buildProductCard(BuildContext context) {
    return InkWell(
      onTap: () {
        TapHelper.navigateToProductInfo(context, products[index]);
      },
      child: Padding(
        padding: EdgeInsets.all(10.h),
        child: SizedBox(
          height: 300.h,
          child: Stack(
            children: [
              _buildProductImage(),
              ProductBannerWidget(product: products[index]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Card(
        elevation: 2,
        child: CustomCachedNetworkImage(
          imageUrl: "${products[index].thumbnail}",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

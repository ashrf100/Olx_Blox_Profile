import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/ProductBannerWidget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/CustomCachedNetworkImage.dart';

class HomeSliderWidget extends StatelessWidget {
  final List<Product> products;

  const HomeSliderWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370.h,
      child: Stack(
        children: [
          _buildProductList(context),
          _buildBackGround(),
        ],
      ),
    );
  }

  IgnorePointer _buildBackGround() {
    return IgnorePointer(
      child: ClipRect(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                AppColors.primary,
                AppColors.primary,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductList(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) => _bannerItem(context, index),
      options: CarouselOptions(
        height: 350.h,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
      ),
      itemCount: 5,
    );
  }

  Widget _bannerItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        TapHelper.navigateToProductInfo(context, products[index]);
      },
      child: Stack(
        children: [
          Container(
            color: AppColors.primaryVariant,
            child: CustomCachedNetworkImage(
              imageUrl: products[index * 4].thumbnail.toString(),
              fit: BoxFit.fill,
            ),
          ),
          ProductBannerWidget(product: products[index], bottom: 100.h),
        ],
      ),
    );
  }
}

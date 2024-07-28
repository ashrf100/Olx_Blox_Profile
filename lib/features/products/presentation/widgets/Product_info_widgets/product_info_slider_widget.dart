import 'package:carousel_slider/carousel_slider.dart ';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart ';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/bloc/product_info/product_info_cubit.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/CustomCachedNetworkImage.dart';

class ProductInfoSlider extends StatelessWidget {
  final Product product;

  const ProductInfoSlider({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, realIndex) {
        return slideImage(product.images![index]);
      },
      carouselController:
          BlocProvider.of<ProductInfoCubit>(context).carouselController,
      options: CarouselOptions(
        height: 330.h,
        autoPlay: true,
        aspectRatio: 1.7.w,
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 1.0.w,
        enableInfiniteScroll: true,
        onPageChanged: (index, reason) {
          TapHelper.onProductInfoSliderChanged(index, context);
        },
      ),
      itemCount: product.images!.length,
    );
  }

  CustomCachedNetworkImage slideImage(String? image) {
    return CustomCachedNetworkImage(
      imageUrl: image!,
      fit: BoxFit.fill,
    );
  }
}

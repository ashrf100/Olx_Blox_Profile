import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart ';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/bloc/product_info/product_info_cubit.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/CustomCachedNetworkImage.dart';

class ProductInfoThumbnail extends StatelessWidget {
  final Product product;
  const ProductInfoThumbnail({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductInfoCubit, ProductInfoInitial>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          height: 70.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: product.images!.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  TapHelper.onTapThumbnail(context, index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.all(5.0.w),
                  width: 70.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    border: Border.all(
                      color: index == state.pageIndex
                          ? AppColors.primaryLight
                          : AppColors.primaryVariant,
                      width: index == state.pageIndex ? 3.0.w : 1.0.w,
                    ),
                  ),
                  child: CustomCachedNetworkImage(
                    imageUrl: product.images![index].toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

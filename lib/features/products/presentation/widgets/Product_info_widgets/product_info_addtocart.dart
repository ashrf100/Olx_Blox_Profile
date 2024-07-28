import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/bloc/product_info/product_info_cubit.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/list_product_widget.dart';

class ProductInfoAddToCart extends StatelessWidget {
  final Product product;

  const ProductInfoAddToCart({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Row(
        children: [
          Expanded(
            child: AddToCartButton(
              product: product,
              height: 30.h,
              onTap: () {
                TapHelper.addToCart(
                  context,
                  product,
                  context.read<ProductInfoCubit>().quantity,
                );
              },
            ),
          ),
          _buildQuantityControl(context),
        ],
      ),
    );
  }

  Widget _buildQuantityControl(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 30.h,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.primary, width: 1.5.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildIncrementButton(context),
            _buildQuantityDisplay(context),
            _buildDecrementButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildIncrementButton(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        TapHelper.onIncrementButton(context);
      },
      icon: const Icon(Icons.add, color: AppColors.primaryDark),
      iconSize: 24.sp,
    );
  }

  Widget _buildQuantityDisplay(BuildContext context) {
    return BlocBuilder<ProductInfoCubit, ProductInfoInitial>(
      builder: (context, state) {
        return Text(
          state.quantity.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                height: 0.5.h,
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
        );
      },
    );
  }

  Widget _buildDecrementButton(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        TapHelper.onDecrementButton(context);
      },
      icon: const Icon(Icons.remove, color: AppColors.primaryDark),
      iconSize: 24.sp,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/CustomCachedNetworkImage.dart';
import 'package:olx_bloc/generated/l10n.dart';

class ListProductWidget extends StatelessWidget {
  final Product product;
  final Function onTap;
  final bool showButton;

  const ListProductWidget({
    Key? key,
    required this.product,
    required this.onTap,
    this.showButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          SizedBox(
            height: 150.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(product: product),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 5.h),
                        ProductTitle(product: product),
                        ProductPricing(product: product),
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CategoryBadge(product: product),
                              SizedBox(width: 10.w),
                              RatingBadge(product: product)
                            ],
                          ),
                        ),
                        showButton
                            ? AddToCartButton(product: product, onTap: onTap)
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          DiscountBanner(product: product)
        ],
      ),
    );
  }
}

class DiscountBanner extends StatelessWidget {
  final Product product;

  const DiscountBanner({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 25.h,
      color: AppColors.errorDark.withOpacity(0.9),
      child: FittedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('%${product.discountPercentage}',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppColors.primaryVariant,
                      fontWeight: FontWeight.w600)),
              SizedBox(width: 1.w),
              Text(S.of(context).OFF,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppColors.primaryVariant,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final Product product;
  final BoxFit? fit;
  const ProductImage({
    Key? key,
    required this.product,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomCachedNetworkImage(
          fit: fit ?? BoxFit.cover, imageUrl: product.thumbnail.toString()),
    );
  }
}

class ProductTitle extends StatelessWidget {
  final Product product;
  final Color? color;

  const ProductTitle({
    Key? key,
    required this.product,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(product.title.toString(),
          textAlign: TextAlign.start,
          maxLines: 2,
          softWrap: true,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: color ?? AppColors.primaryDark,
                fontWeight: FontWeight.w600,
                height: 1.h,
              )),
    );
  }
}

class ProductPricing extends StatelessWidget {
  final Product product;

  const ProductPricing({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${product.price}.00 US',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.primary,
                  height: 1.h,
                  fontWeight: FontWeight.w600)),
          SizedBox(width: 5.w),
          Text('|',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.primary.withOpacity(0.5),
                  height: 1.h,
                  fontWeight: FontWeight.w600)),
          SizedBox(width: 5.w),
          Text('${product.price}.00 US',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.primary,
                  decorationColor: AppColors.primaryDark,
                  height: 1.h,
                  decoration: TextDecoration.lineThrough)),
        ],
      ),
    );
  }
}

class CategoryBadge extends StatelessWidget {
  final Product product;

  const CategoryBadge({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryLight.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Text(
        product.category.toString(),
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: AppColors.primaryDark.withOpacity(0.5),
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}

class RatingBadge extends StatelessWidget {
  final Product product;

  const RatingBadge({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.orange.withOpacity(0.5),
          size: 15.sp,
        ),
        Text(
          '${product.rating}/5',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}

class AddToCartButton extends StatelessWidget {
  final Product product;
  final double? height;
  final Function onTap;

  const AddToCartButton({
    Key? key,
    required this.product,
    required this.onTap,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        bool isLoading =
            state is AddToCartButtonLoadingState && state.id == product.id;

        return GestureDetector(
          onTap: isLoading ? () {} : () => onTap(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: AppColors.primary,
            ),
            clipBehavior: Clip.antiAlias,
            width: double.infinity,
            height: height ?? 25.h,
            child: isLoading
                ? Center(
                    child: LoadingAnimationWidget.fallingDot(
                      color: AppColors.primaryVariant,
                      size: 25.w,
                    ),
                  )
                : const Center(
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.primaryVariant,
                    ),
                  ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart ';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/products/presentation/bloc/home/home_bloc.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/flash_sale_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class AddToCartBottomSheet extends StatelessWidget {
  final String productName;

  const AddToCartBottomSheet({super.key, required this.productName});

  @override
  Widget build(BuildContext context) {
    final products = BlocProvider.of<HomeBloc>(context).homeProductsList;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0.r),
          topRight: Radius.circular(30.0.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.check_circle,
            size: 50.sp,
            color: AppColors.primaryVariant,
          ),
          SizedBox(height: 5.0.h),
          FittedBox(
            child: Text(
              productName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.primaryVariant),
            ),
          ),
          Text(
            S.of(context).HasbeenSuccessfullyAddedtoyourCart,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.primaryVariant),
          ),
          products != null ? ProductList(products: products) : const SizedBox()
        ],
      ),
    );
  }
}

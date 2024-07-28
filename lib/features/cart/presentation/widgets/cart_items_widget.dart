import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/cart/domain/entities/cart.dart';
import 'package:olx_bloc/generated/l10n.dart';

class CartItemsWidget extends StatelessWidget {
  final Cart cart;
  const CartItemsWidget({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: ListView.builder(
          itemCount: cart.products.length,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return _buildItemCard(context, cart.products[index]);
          },
        ),
      ),
    );
  }

  Card _buildItemCard(BuildContext context, CartProduct product) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildTitle(context, product.title),
          _buildDataTable(context, product),
          _buildQuantityAndDeleteButton(context, product.quantity),
        ],
      ),
    );
  }

  Padding _buildTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
      child: FittedBox(
        child: Text(
          title,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: AppColors.primary, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Center _buildDataTable(BuildContext context, CartProduct product) {
    return Center(
      child: DataTable(
        border: TableBorder.all(width: 1.5.w, color: AppColors.primary),
        columnSpacing: 13.w,
        horizontalMargin: 10.w,
        columns: [
          _buildDataColumn(context, S.of(context).price),
          _buildDataColumn(context, S.of(context).Discount),
          _buildDataColumn(context, S.of(context).Beforediscount),
          _buildDataColumn(context, S.of(context).Total),
        ],
        rows: [
          DataRow(cells: [
            _buildDataCell(context, '${product.price} us'),
            _buildDataCell(context, '${product.discountPercentage} %'),
            _buildDataCell(context, '${product.discountedPrice} us'),
            _buildDataCell(context, '${product.total} us'),
          ]),
        ],
      ),
    );
  }

  Padding _buildQuantityAndDeleteButton(BuildContext context, int quantity) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildQuantity(context, quantity.toString()),
          _buildDeleteButton(context),
        ],
      ),
    );
  }

  MaterialButton _buildDeleteButton(context) {
    return MaterialButton(
      minWidth: 10.w,
      padding: EdgeInsets.zero,
      child: Icon(
        Icons.delete,
        size: 25.sp,
        color: AppColors.primary,
      ),
      onPressed: () {
        showSnackbar(
            context: context,
            message: S.of(context).WeApologizeSignupisCurrentlyDisabled,
            isSuccess: false);
      },
    );
  }

  Container _buildQuantity(BuildContext context, String quantity) {
    return Container(
      height: 30.h,
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.primary, width: 1.5.w),
      ),
      child: Row(
        children: [
          _buildIncrementButton(),
          _buildQuantityText(context, quantity),
          _buildDecrementButton(),
        ],
      ),
    );
  }

  IconButton _buildIncrementButton() {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        //  controller.incrementQuantity();
      },
      icon: const Icon(Icons.add, color: AppColors.primaryDark),
      iconSize: 20.sp,
    );
  }

  IconButton _buildDecrementButton() {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        //  controller.incrementQuantity();
      },
      icon: const Icon(Icons.remove, color: AppColors.primaryDark),
      iconSize: 20.sp,
    );
  }

  Text _buildQuantityText(BuildContext context, String quantity) {
    return Text(
      quantity.toString(),
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(color: AppColors.primary, fontWeight: FontWeight.w800),
    );
  }

  DataCell _buildDataCell(BuildContext context, String title) {
    return DataCell(
      SizedBox(
        width: 60.w,
        child: Center(
          child: Text(title.toUpperCase(),
              softWrap: true,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColors.primary,
                  height: 1.h,
                  fontWeight: FontWeight.w800)),
        ),
      ),
    );
  }

  DataColumn _buildDataColumn(BuildContext context, String title) {
    return DataColumn(
      label: SizedBox(
        width: 60.w,
        child: Center(
          child: Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.primaryDark,
                height: 1.h,
                fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}

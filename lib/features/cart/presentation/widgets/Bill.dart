import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/cart/domain/entities/cart.dart';
import 'package:olx_bloc/generated/l10n.dart';

class CartBillWidget extends StatelessWidget {
  final Cart cart;

  const CartBillWidget({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.only(bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBillItem(
                  label: S.of(context).Productcount,
                  value: cart.totalProducts.toString(),
                  context: context),
              _buildBillItem(
                  label: S.of(context).TotalQuantity,
                  value: cart.totalQuantity.toString(),
                  context: context),
            ],
          ),
          _buildConfirmPaymentButton(context, cart),
        ],
      ),
    );
  }

  Widget _buildBillItem(
      {required BuildContext context,
      required String label,
      required String value}) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStyledText(context, label, AppColors.primaryVariant),
          SizedBox(width: 5.w),
          _buildStyledText(context, value, AppColors.primaryLight),
        ],
      ),
    );
  }

  Widget _buildStyledText(BuildContext context, String text, Color color) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: color, height: 1.h, fontWeight: FontWeight.w600));
  }

  Widget _buildConfirmPaymentButton(BuildContext context, Cart cart) {
    return SizedBox(
      width: 330.w,
      height: 40.h,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primaryDark)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 5.w),
                const Icon(Icons.done, color: AppColors.primaryVariant),
                SizedBox(width: 5.w),
                _buildStyledText(context, S.of(context).ConfirmPayment,
                    AppColors.primaryVariant),
              ],
            ),
            SizedBox(width: 5.w),
            Flexible(
              child: _buildStyledText(context, "${cart.discountedTotal}.00 US",
                  AppColors.primaryLight),
            ),
            SizedBox(width: 5.w)
          ],
        ),
      ),
    );
  }
}

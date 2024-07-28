import 'package:flutter/material.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:olx_bloc/features/cart/presentation/pages/cart_bottom_sheet.dart';

showCartBottomSheet(BuildContext context, AddToCartSuccessState state) {
  return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: AppColors.primaryDark.withOpacity(0.9),
      isDismissible: true,
      context: context,
      builder: (context) {
        return AddToCartBottomSheet(productName: state.msg);
      });
}

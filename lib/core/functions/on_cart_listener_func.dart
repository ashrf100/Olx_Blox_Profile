import 'package:flutter/material.dart';
import 'package:olx_bloc/core/functions/show_cart_bottom_sheet.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/cart/presentation/bloc/cart_bloc.dart';

Future<void> onCartListener(CartState state, BuildContext context) async {
  if (state is AddToCartSuccessState) {
    await showCartBottomSheet(context, state);
  } else if (state is AddToCartErorrState) {
    showSnackbar(context: context, message: state.msg, isSuccess: false);
  }
}

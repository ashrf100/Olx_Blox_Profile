part of 'cart_bloc.dart';

@immutable
sealed class CartState {
  
}

class CartInitState extends CartState {
  final Cart cart;
  final int totalProducts;

  CartInitState({
    required this.cart,
    required this.totalProducts,
  });
}

class CartloadingState extends CartState {}

class CartErorrState extends CartState {
  final String msg;

  CartErorrState({required this.msg});
}

class CartEmptyState extends CartState {}

class AddToCartSuccessState extends CartState {
  final String msg;

  AddToCartSuccessState({required this.msg});
}

class AddToCartErorrState extends CartState {
  final String msg;

  AddToCartErorrState({required this.msg});
}

class AddToCartButtonLoadingState extends CartState {
  final int id;

  AddToCartButtonLoadingState({required this.id});
}

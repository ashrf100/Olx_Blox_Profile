part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitEvent extends CartEvent {
  final BuildContext context;

  CartInitEvent({required this.context});
}

class AddToCartEvent extends CartEvent {
  final Product product;
  final int quantity;
  final BuildContext context;

  AddToCartEvent(
      {this.quantity = 1, required this.product, required this.context});
}

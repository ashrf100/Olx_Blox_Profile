import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:olx_bloc/core/error/failures_msg.dart';
import 'package:olx_bloc/features/cart/domain/entities/cart.dart';
import 'package:olx_bloc/features/cart/domain/usecase/cart_usecases.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUseCase getCartUseCase;
  final AddToCartUseCase addToCartUseCase;
  int cartItemsCount = 0;
  late Cart cart;
  CartBloc({required this.getCartUseCase, required this.addToCartUseCase})
      : super(CartloadingState()) {
    on<CartInitEvent>((event, emit) async {
      final failureOrCart = await getCartUseCase(userid: 50);

      failureOrCart.fold(
          (failure) => emit(
              CartErorrState(msg: mapFailureToMessage(failure, event.context))),
          (cartData) {
        cart = cartData;
        cartItemsCount = cart.totalProducts;
        emit(CartInitState(cart: cart, totalProducts: cartItemsCount));
      });
    });

    on<AddToCartEvent>((event, emit) async {
      emit(AddToCartButtonLoadingState(id: event.product.id!));
      final failureOrAddToCart = await addToCartUseCase(
          userId: "50", id: event.product.id!, quantity: event.quantity);

      failureOrAddToCart.fold(
          (failure) => emit(AddToCartErorrState(
              msg: mapFailureToMessage(failure, event.context))), (unit) {
        emit(AddToCartSuccessState(msg: event.product.title!));
        cartItemsCount = cartItemsCount + 1;
        emit(CartInitState(cart: cart, totalProducts: cartItemsCount));
      });
    }, transformer: droppable());
  }
}

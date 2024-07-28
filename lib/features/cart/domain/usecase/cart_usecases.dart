import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/features/cart/domain/entities/cart.dart';
import 'package:olx_bloc/features/cart/domain/repositories/cart_repostiory.dart';

class GetCartUseCase {
  final CartRepository repostiory;

  GetCartUseCase({required this.repostiory});

  Future<Either<Failure, Cart>> call({required int userid}) async {
    return await repostiory.getCart(userid);
  }
}

class AddToCartUseCase {
  final CartRepository repostiory;

  AddToCartUseCase({required this.repostiory});

  Future<Either<Failure, Unit>> call(
      {required String userId, required int id, required int quantity}) async {
    return await repostiory.addToCart(userId, id, quantity);
  }
}

class DeletFromCartUseCase {
  final CartRepository repostiory;

  DeletFromCartUseCase({required this.repostiory});

  Future<Either<Failure, Unit>> call() async {
    return await repostiory.deleteFromCart();
  }
}

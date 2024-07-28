import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/features/cart/domain/entities/cart.dart';

abstract class CartRepository {
  // Get user Cart
  Future<Either<Failure, Cart>> getCart(int userId);

  // Add to cart
  Future<Either<Failure, Unit>> addToCart(String userId, int id, int quantity);

  // Delete from cart
  Future<Either<Failure, Unit>> deleteFromCart();
}

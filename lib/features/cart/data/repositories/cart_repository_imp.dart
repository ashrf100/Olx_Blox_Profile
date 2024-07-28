import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/exceptions.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/core/services/network_info.dart';
import 'package:olx_bloc/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:olx_bloc/features/cart/data/model/cart_model.dart';
import 'package:olx_bloc/features/cart/domain/entities/cart.dart';
import 'package:olx_bloc/features/cart/domain/repositories/cart_repostiory.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl(
      {required this.networkInfo, required this.cartRemoteDataSource});

  @override
  Future<Either<Failure, Cart>> getCart(int userid) async {
    if (await networkInfo.isDeviceConnected) {
      try {
        final CartModel cartModel =
            await cartRemoteDataSource.getCartmodel(userid);

        if (cartModel.carts.isNotEmpty) {
          final Cart cart = cartModel.carts[0].toDomain();
          ;
          return Right(cart);
        } else {
          return left(CacheErrorFailure());
        }
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addToCart(
      String userId, int id, int quantity) async {
    if (await networkInfo.isDeviceConnected) {
      try {
        await cartRemoteDataSource.addToCart(userId, id, quantity);

        return const Right(unit);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteFromCart() {
    // TODO: implement deleteFromCart
    throw UnimplementedError();
  }
}

import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';

abstract class ProductsRepostiory {
  Future<Either<Failure, Tuple2<List<Product>, List<String>>>> getHomeData(
      int limit);
//   products
  Future<Either<Failure, List<Product>>> getAppProducts(
      int limit, int skip, String categoryName);
//  categories
  Future<Either<Failure, List<String>>> getAppCategories();
//Search products
  Future<Either<Failure, List<Product>>> getAppSearchProducts(
      String searchText);

  Future<Either<Failure, List<String>>> getCachedRecentSearch();

//Get a single product
  Future<Either<Failure, Product>> getAppSingleProduct();
}

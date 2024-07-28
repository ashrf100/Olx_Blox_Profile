import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/domain/repositories/products_repository.dart';

class GetAppProductsUseCase {
  final ProductsRepostiory repostiory;

  GetAppProductsUseCase({required this.repostiory});

  Future<Either<Failure, List<Product>>> call({
    required int limit,
    required int skip,
    required String categoryName,
  }) async {
    return await repostiory.getAppProducts(limit, skip, categoryName);
  }
}

class GetAppCategoriesUseCase {
  final ProductsRepostiory repostiory;

  GetAppCategoriesUseCase({required this.repostiory});

  Future<Either<Failure, List<String>>> call() async {
    return await repostiory.getAppCategories();
  }
}

class GetHomeDataUseCase {
  final ProductsRepostiory repostiory;

  GetHomeDataUseCase({required this.repostiory});

  Future<Either<Failure, Tuple2<List<Product>, List<String>>>> call(
      {required int limit}) async {
    return await repostiory.getHomeData(limit);
  }
}

class GetAppSearchProductsUseCase {
  final ProductsRepostiory repostiory;

  GetAppSearchProductsUseCase({required this.repostiory});

  Future<Either<Failure, List<Product>>> call(
      {required String searchText}) async {
    return await repostiory.getAppSearchProducts(searchText);
  }
}

class GetCachedRecentSearchUseCase {
  final ProductsRepostiory repostiory;

  GetCachedRecentSearchUseCase({required this.repostiory});

  Future<Either<Failure, List<String>>> call() async {
    return await repostiory.getCachedRecentSearch();
  }
}

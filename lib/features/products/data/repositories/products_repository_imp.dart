import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/exceptions.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/core/services/network_info.dart';
import 'package:olx_bloc/features/products/data/datasources/Products_local_data_source.dart';
import 'package:olx_bloc/features/products/data/datasources/products_remote_data_source.dart';
import 'package:olx_bloc/features/products/data/models/Categories_model.dart';
import 'package:olx_bloc/features/products/data/models/products_model.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepostiory {
  final ProductsRemoteDataSource productsRemoteDataSource;
  final ProductsLocalDataSource productsLocalDataSource;
  final NetworkInfo networkInfo;

  List<String> recentSearches = [];

  ProductsRepositoryImpl(
      {required this.productsLocalDataSource,
      required this.networkInfo,
      required this.productsRemoteDataSource});

  @override
  Future<Either<Failure, Tuple2<List<Product>, List<String>>>> getHomeData(
      int limit) async {
    if (await networkInfo.isDeviceConnected) {
      try {
        final tuple = await productsRemoteDataSource.getHomeData(limit);

        ProductsModel products = tuple.value1;
        CategoriesModel categories = tuple.value2;

        final List<Product> productsList =
            products.products!.map((product) => product.toProduct()).toList();

        final List<String> categoriesList = categories.categories!;

        return Right(Tuple2(productsList, categoriesList));
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAppProducts(
      int limit, int skip, String categoryName) async {
    if (await networkInfo.isDeviceConnected) {
      try {
        final products = await productsRemoteDataSource.getProducts(
            limit, skip, categoryName);

        final List<Product> productsList =
            products.products!.map((product) => product.toProduct()).toList() ??
                [];

        return Right(productsList);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<String>>> getAppCategories() async {
    if (await networkInfo.isDeviceConnected) {
      try {
        final categories = await productsRemoteDataSource.getcategories();
        final List<String> productsList = categories.categories!;
        return Right(productsList);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAppSearchProducts(
      String searchText) async {
    if (await networkInfo.isDeviceConnected) {
      try {
        final products =
            await productsRemoteDataSource.getSearchProducts(searchText);
        final List<Product> productsList =
            products.products!.map((product) => product.toProduct()).toList();

        recentSearches.add(searchText);
        if (recentSearches.length > 5) {
          recentSearches.removeAt(0);
        }
        productsLocalDataSource.cacheSearchTexts(recentSearches);

        return Right(productsList);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getAppSingleProduct() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<String>>> getCachedRecentSearch() async {
    try {
      final cachedSearchTexts = productsLocalDataSource.getCacheSearchTexts();

      return right(cachedSearchTexts);
    } on CacheErrorException {
      return left(CacheErrorFailure());
    }
  }
}

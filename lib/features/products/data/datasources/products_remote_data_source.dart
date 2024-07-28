import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/const/app_links.dart';
import 'package:olx_bloc/core/error/exceptions.dart';
import 'package:olx_bloc/features/products/data/models/Categories_model.dart';
import 'package:olx_bloc/features/products/data/models/products_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductsRemoteDataSource {
  Future<ProductsModel> getProducts(
    int limit,
    int skip,
    String categoryName,
  );
  Future<CategoriesModel> getcategories();
  Future<Tuple2<ProductsModel, CategoriesModel>> getHomeData(int limit);
  Future<ProductsModel> getSearchProducts(String searchText);
}

class ProductsRemoteDataSourceHttp implements ProductsRemoteDataSource {
  final http.Client client;

  ProductsRemoteDataSourceHttp({required this.client});
  @override
  Future<ProductsModel> getProducts(
      int limit, int skip, String categoryName) async {
    String categoryFilter =
        (categoryName == "all products" || categoryName == "")
            ? ""
            : "/category/$categoryName";
    String url = "${AppLinks.products}$categoryFilter?limit=$limit&skip=$skip";
    print(url);
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final productJsonDecode = jsonDecode(response.body);
      final ProductsModel productsModel =
          ProductsModel.fromJson(productJsonDecode);
      return productsModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductsModel> getSearchProducts(String searchText) async {
    String url = "${AppLinks.products}/search?q=$searchText";
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final productJsonDecode = jsonDecode(response.body);
      final ProductsModel productsModel =
          ProductsModel.fromJson(productJsonDecode);
      return productsModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CategoriesModel> getcategories() async {
    final response = await client.get(Uri.parse(AppLinks.categories));

    if (response.statusCode == 200) {
      final productJsonDecode = jsonDecode(response.body);
      final CategoriesModel categoriesModel =
          CategoriesModel.fromJson(productJsonDecode);
      return categoriesModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Tuple2<ProductsModel, CategoriesModel>> getHomeData(int limit) async {
    final productsRequest =
        client.get(Uri.parse("${AppLinks.products}?limit=$limit"));
    final categoriesRequest = client.get(Uri.parse(AppLinks.categories));

    final responses = await Future.wait([productsRequest, categoriesRequest]);

    if (responses[0].statusCode == 200 && responses[1].statusCode == 200) {
      try {
        final productJsonDecode = jsonDecode(responses[0].body);
        final categoriesJsonDecode = jsonDecode(responses[1].body);

        final ProductsModel productsModel =
            ProductsModel.fromJson(productJsonDecode);
        final CategoriesModel categoriesModel =
            CategoriesModel.fromJson(categoriesJsonDecode);

        return Tuple2(productsModel, categoriesModel);
      } catch (e) {
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }
}

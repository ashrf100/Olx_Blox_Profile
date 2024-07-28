import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/const/app_links.dart';
import 'package:olx_bloc/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:olx_bloc/features/cart/data/model/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<CartModel> getCartmodel(int userid);
  Future<Unit> addToCart(String userId, int id, int quantity);
}

class CartRemoteDataSourceHttp implements CartRemoteDataSource {
  final http.Client client;

  CartRemoteDataSourceHttp({required this.client});

  @override
  Future<CartModel> getCartmodel(int userid) async {
    String url = "${AppLinks.cart}/user/$userid";

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final productJsonDecode = jsonDecode(response.body);
      final CartModel cartModel = CartModel.fromJson(productJsonDecode);
      return cartModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addToCart(String userId, int id, int quantity) async {
    String url = "${AppLinks.cart}/add";

    Map<String, String>? header = {'Content-Type': 'application/json'};
    final data = jsonEncode({
      'userId': userId,
      'products': [
        {'id': id, 'quantity': quantity}
      ]
    });

    final response =
        await client.post(Uri.parse(url), headers: header, body: data);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}

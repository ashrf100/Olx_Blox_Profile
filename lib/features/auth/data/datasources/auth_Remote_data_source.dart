import 'dart:convert';

import 'package:olx_bloc/core/const/app_links.dart';
import 'package:olx_bloc/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:olx_bloc/features/auth/data/model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> logIn({
    required String userName,
    required String password,
  });
}

class AuthRemoteDataSourceHttp implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceHttp({required this.client});

  @override
  Future<UserModel> logIn({
    required String userName,
    required String password,
  }) async {
    String url = AppLinks.login;
    final data = {
      "username": userName,
      "password": password,
    };

    final response = await client.post(Uri.parse(url), body: data);

    print(data);

    if (response.statusCode == 200) {
      final userJsonDecode = jsonDecode(response.body);

      final UserModel userModel = UserModel.fromJson(userJsonDecode);

      return userModel;
    } else if (response.statusCode == 400) {
      throw AuthErrorException();
    } else {
      throw ServerException();
    }
  }
}

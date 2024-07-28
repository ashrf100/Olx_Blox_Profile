import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/const/strings.dart';
import 'package:olx_bloc/core/error/exceptions.dart';
import 'package:olx_bloc/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<UserModel> getCacheUser();
  Future<Unit> cacheUser(UserModel userModel);
  Future<Unit> deletCacheUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheUser(UserModel userModel) {
    final userModelToJson = userModel.toJson();
    sharedPreferences.setString(
        AppKeys.CACHED_USER, jsonEncode(userModelToJson));
    return Future.value(unit);
  }

  @override
  Future<UserModel> getCacheUser() {
    final cachedUser = sharedPreferences.getString(AppKeys.CACHED_USER);
    if (cachedUser != null) {
      final cacheProductDecode = jsonDecode(cachedUser);
      UserModel cachedUserToModel = UserModel.fromJson(cacheProductDecode);
      return Future.value(cachedUserToModel);
    } else {
      throw AuthErrorException();
    }
  }

  @override
  Future<Unit> deletCacheUser() {
    sharedPreferences.remove(AppKeys.CACHED_USER);
    return Future.value(unit);
  }
}

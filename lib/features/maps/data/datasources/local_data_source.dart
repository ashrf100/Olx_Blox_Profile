import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/const/strings.dart';
import 'package:olx_bloc/core/error/exceptions.dart';
import 'package:olx_bloc/features/maps/data/models/location_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MapsLocalDataSource {
  Future<LocationModel> getLastLocation();
  Future<Unit> cacheLocation(LocationModel locationToCache);
}

class LocalDataSourceImpl implements MapsLocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<LocationModel> getLastLocation() {
    final cachedLocation = sharedPreferences.getString(AppKeys.CACHED_LOCATION);
    if (cachedLocation != null) {
      final cacheLocationDecode = jsonDecode(cachedLocation);
      LocationModel cachedlocationToModel =
          LocationModel.fromJson(cacheLocationDecode);
      print("////////////////////////////////////////////done");

      return Future.value(cachedlocationToModel);
    } else {
      throw CacheErrorException();
    }
  }

  @override
  Future<Unit> cacheLocation(LocationModel locationToCache) {
    final locationModelToJson = locationToCache.toJson();
    sharedPreferences.setString(
        AppKeys.CACHED_LOCATION, jsonEncode(locationModelToJson));

    return Future.value(unit);
  }
}

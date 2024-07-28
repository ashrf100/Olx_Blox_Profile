import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/const/strings.dart';
import 'package:olx_bloc/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductsLocalDataSource {
  List<String> getCacheSearchTexts();
  Future<Unit> cacheSearchTexts(List<String> searchTexts);
}

class ProductsLocalDataSourceImpl implements ProductsLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheSearchTexts(List<String> searchTexts) async {
 
    await sharedPreferences.setStringList(AppKeys.RECENT_SEARCH, searchTexts);
    return Future.value(unit);
  }

  @override
  List<String> getCacheSearchTexts() {
    final cachedSearchTexts =
        sharedPreferences.getStringList(AppKeys.RECENT_SEARCH);

    if (cachedSearchTexts != null) {
      return cachedSearchTexts;
    } else {
      throw CacheErrorException();
    }
  }
}

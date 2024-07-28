import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/const/strings.dart';
import 'package:olx_bloc/core/error/exceptions.dart';
import 'package:olx_bloc/features/localizations/domain/entities/localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalizationDataSource {
  Future<String> getLanguageCode();
  Future<void> saveLanguageCode(Localization localization);
}

class LocalizationDataSourceImpl implements LocalizationDataSource {
  final SharedPreferences sharedPreferences;

  LocalizationDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String> getLanguageCode() async {
    final cachedLanguageCode = sharedPreferences.getString(AppKeys.LANG_CODE);

    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      throw CacheErrorException;
    }
  }

  @override
  Future<void> saveLanguageCode(Localization localization) async {
    sharedPreferences.setString(AppKeys.LANG_CODE, localization.languageCode);
  }
}

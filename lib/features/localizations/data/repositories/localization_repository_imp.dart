import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/exceptions.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/features/localizations/data/datasources/localizations_local_data_source.dart';
import 'package:olx_bloc/features/localizations/domain/entities/localization.dart';
import 'package:olx_bloc/features/localizations/domain/repository/localization_repository.dart';

class LocalizationRepositoryImpl implements LocalizationRepository {
  final LocalizationDataSource localizationDataSource;

  LocalizationRepositoryImpl({required this.localizationDataSource});

  @override
  Future<Either<Failure, Localization>> getLocalization() async {
    try {
      final localLocalization = await localizationDataSource.getLanguageCode();
      final Localization localization =
          Localization(languageCode: localLocalization);

      return right(localization);
    } on CacheErrorException {
      return left(CacheErrorFailure());
    }
  }

  @override
  Future<void> changeLocal(Localization localization) async {
    await localizationDataSource.saveLanguageCode(localization);
  }
}

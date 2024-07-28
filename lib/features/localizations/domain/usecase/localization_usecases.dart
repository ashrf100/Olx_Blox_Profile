import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/features/localizations/domain/entities/localization.dart';
import 'package:olx_bloc/features/localizations/domain/repository/localization_repository.dart';

class GetLocalizationUseCase {
  final LocalizationRepository repository;

  GetLocalizationUseCase({required this.repository});

  Future<Either<Failure, Localization>> call() async {
    return await repository.getLocalization();
  }
}

class ChangeLocalizationUseCase {
  final LocalizationRepository repository;

  ChangeLocalizationUseCase({required this.repository});

  Future<void> call(Localization localization) async {
    return await repository.changeLocal(localization);
  }
}

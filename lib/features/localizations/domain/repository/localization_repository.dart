import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/features/localizations/domain/entities/localization.dart';

abstract class LocalizationRepository {
  Future<Either<Failure, Localization>> getLocalization();
  Future<void> changeLocal(Localization localization);
}

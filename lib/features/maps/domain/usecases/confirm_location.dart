import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/features/maps/domain/entities/location.dart';
import 'package:olx_bloc/features/maps/domain/repositories/maps_repository.dart';

class ConfirmLocation {
  final MapsRepository repository;

  ConfirmLocation(this.repository);

  Future<Either<Failure, UserLocation>> call(UserLocation location) async {
    return await repository.confirmLocation(location);
  }
}

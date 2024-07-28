import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/features/maps/domain/entities/location.dart';
import 'package:olx_bloc/features/maps/domain/repositories/maps_repository.dart';

class SaveLocation {
  final MapsRepository repository;

  SaveLocation({required this.repository});

  Future<Either<Failure, Unit>> call(UserLocation location) async {
    return await repository.saveLocation(location);
  }
}

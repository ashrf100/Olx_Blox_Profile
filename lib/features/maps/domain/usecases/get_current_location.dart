import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/features/maps/domain/entities/location.dart';
import 'package:olx_bloc/features/maps/domain/repositories/maps_repository.dart';

class GetCurrentLocation {
  final MapsRepository repository;

  GetCurrentLocation({required this.repository});

  Future<Either<Failure, UserLocation>> call() async {
    return await repository.getCurrentLocation();
  }
}

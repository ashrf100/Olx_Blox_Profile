import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/features/maps/domain/entities/location.dart';

abstract class MapsRepository {
  Future<Either<Failure, UserLocation>> getCurrentLocation();
  Future<Either<Failure, Unit>> saveLocation(UserLocation location);
  Future<Either<Failure, UserLocation>> getSavedLocation();
  Future<Either<Failure, UserLocation>> confirmLocation(UserLocation location);
}

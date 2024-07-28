import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/exceptions.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/core/services/network_info.dart';
import 'package:olx_bloc/features/maps/data/datasources/local_data_source.dart';
import 'package:olx_bloc/features/maps/data/datasources/remote_data_source.dart';
import 'package:olx_bloc/features/maps/data/models/location_model.dart';
import 'package:olx_bloc/features/maps/domain/entities/location.dart';
import 'package:olx_bloc/features/maps/domain/repositories/maps_repository.dart';

class MapsRepositoryImpl implements MapsRepository {
  final MapsLocalDataSource localDataSource;
  final MapsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MapsRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserLocation>> getCurrentLocation() async {
    try {
      final localLocation = await localDataSource.getLastLocation();
      return Right(localLocation);
    } on CacheErrorException {
      return Left(CacheErrorFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> saveLocation(UserLocation location) async {
    if (await networkInfo.isDeviceConnected) {
      try {
        final locationModel = LocationModel(
          latitude: location.latitude,
          longitude: location.longitude,
        );
        await localDataSource.cacheLocation(locationModel);
        return const Right(unit);
      } on CacheErrorException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserLocation>> getSavedLocation() async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserLocation>> confirmLocation(
      UserLocation location) async {
    // TODO: Implement logic to confirm the location details
    throw UnimplementedError();
  }
}

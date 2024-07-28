import 'package:olx_bloc/features/maps/data/models/location_model.dart';

abstract class MapsRemoteDataSource {
  Future<void> saveLocation(LocationModel location);
}

class RemoteDataSourceImpl implements MapsRemoteDataSource {
  @override
  Future<void> saveLocation(LocationModel location) {
    // TODO: Implement remote server saving logic
    throw UnimplementedError();
  }
}

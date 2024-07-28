import 'package:geolocator/geolocator.dart%20';
import 'package:olx_bloc/features/maps/domain/entities/location.dart';

abstract class GeolocatorService {
  Future<UserLocation> getCurrentPosition();
}

class GeolocatorServiceImpl implements GeolocatorService {
  @override
  Future<UserLocation> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      //  print("serviceEnabled permissions are denied");
    }
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        //    print("Location permissions are denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      //  print("Location permissions are denied  we cannot request permissions");
    }
    final currentPosition = await Geolocator.getCurrentPosition();
    final UserLocation location = UserLocation(
        latitude: currentPosition.latitude,
        longitude: currentPosition.longitude);

    return location;
  }
}

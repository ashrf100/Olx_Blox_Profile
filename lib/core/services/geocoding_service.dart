import 'package:geocoding/geocoding.dart';

class GeocodingService {
  Future<Placemark?> getAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        return placemarks[0];
      }
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}

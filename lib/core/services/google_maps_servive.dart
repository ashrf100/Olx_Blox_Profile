import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:olx_bloc/features/maps/domain/entities/location.dart';

abstract class GoogleMapsService {
  Future<void> goNewCameraPosition({
    required UserLocation location,
    required Completer<GoogleMapController> mapController,
  });
}

class GoogleMapsServiceImpl implements GoogleMapsService {
  @override
  Future<void> goNewCameraPosition({
    required UserLocation location,
    required Completer<GoogleMapController> mapController,
  }) async {
    final GoogleMapController controller = await mapController.future;
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(location.latitude, location.longitude),
      zoom: 17,
    )));
  }
}

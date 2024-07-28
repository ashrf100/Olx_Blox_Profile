import 'package:olx_bloc/features/maps/domain/entities/location.dart';

class LocationModel extends UserLocation {
  LocationModel({
    required double latitude,
    required double longitude,
  }) : super(
          latitude: latitude,
          longitude: longitude,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

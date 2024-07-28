enum UserLocationType { home, work }

class UserLocation {
  final double latitude;
  final double longitude;
  final String? additionalData;
  final UserLocationType? userLocationType;

  UserLocation({
    required this.latitude,
    required this.longitude,
    this.additionalData,
    this.userLocationType,
  });
}

part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class GetPlacemarkEvent extends LocationEvent {
  final UserLocation userLocation;

  const GetPlacemarkEvent({required this.userLocation});
}

class ChangeLocationTypeButton extends LocationEvent {
  final UserLocationType userLocationType;

  const ChangeLocationTypeButton({required this.userLocationType});
}

class SaveLocationEvent extends LocationEvent {
  final UserLocation userLocation;

  const SaveLocationEvent({
    required this.userLocation,
  });
}

class GetSavedLocationEvent extends LocationEvent {}

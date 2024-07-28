part of 'location_bloc.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationLoadingState extends LocationState {}

final class LocationSaveState extends LocationState {}

final class LocationGetSavedState extends LocationState {}

final class LocationInitialState extends LocationState {
  final Placemark placemark;
  final UserLocationType? userLocationType;

  const LocationInitialState({this.userLocationType, required this.placemark});

  LocationInitialState copyWith({
    Placemark? placemark,
    UserLocationType? userLocationType,
  }) {
    return LocationInitialState(
      placemark: placemark ?? this.placemark,
      userLocationType: userLocationType ?? this.userLocationType,
    );
  }
}

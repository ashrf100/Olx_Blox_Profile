part of 'maps_bloc.dart';

abstract class MapsState extends Equatable {
  const MapsState();

  @override
  List<Object> get props => [];
}

class MapsLoadingState extends MapsState {}

class MapsLoadedState extends MapsState {
  final UserLocation userlocation;
  final double zoom;
  final List<Marker> markers;

  const MapsLoadedState(
      {required this.userlocation, required this.zoom, required this.markers});

  @override
  List<Object> get props => [markers, zoom, markers];
}

class MapsSaveSuccess extends MapsState {}

class MapsError extends MapsState {
  final String message;

  const MapsError(this.message);

  @override
  List<Object> get props => [message];
}

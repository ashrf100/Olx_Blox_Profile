part of 'maps_bloc.dart';

abstract class MapsEvent extends Equatable {
  const MapsEvent();

  @override
  List<Object> get props => [];
}

class LoadMap extends MapsEvent {}

class UpdateMapLocation extends MapsEvent {
  final LatLng position;

  const UpdateMapLocation(this.position);

  @override
  List<Object> get props => [position];
}

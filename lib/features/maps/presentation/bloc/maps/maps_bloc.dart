import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:olx_bloc/features/maps/domain/entities/location.dart';

part 'maps_event.dart';
part 'maps_state.dart';

class MapsBloc extends Bloc<MapsEvent, MapsState> {
  List<Marker> markers = [];
  UserLocation userlocation =
      UserLocation(latitude: 29.856724, longitude: 31.275056);

  MapsBloc() : super(MapsLoadingState()) {
    on<LoadMap>((event, emit) => emit(MapsLoadedState(
        markers: markers, userlocation: userlocation, zoom: 6)));

    on<UpdateMapLocation>((event, emit) {
      userlocation = UserLocation(
          latitude: event.position.latitude,
          longitude: event.position.longitude);
      markers.clear();
      markers.add(
        Marker(
          markerId: MarkerId(event.position.toString()),
          position: event.position,
        ),
      );

      emit(MapsLoadedState(
          markers: List.from(markers), userlocation: userlocation, zoom: 14));
    });
  }
}

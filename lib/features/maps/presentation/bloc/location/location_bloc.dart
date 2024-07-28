import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart%20';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/core/services/geocoding_service.dart';
import 'package:olx_bloc/features/maps/domain/entities/location.dart';
import 'package:olx_bloc/features/maps/domain/usecases/get_current_location.dart';
import 'package:olx_bloc/features/maps/domain/usecases/save_location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GeocodingService geocodingService;
  final GetCurrentLocation getCurrentLocation;
  final SaveLocation saveLocation;
  Placemark? placemarks;
  UserLocation? userLocation;

  UserLocationType? userLocationType;
  LocationBloc(
      {required this.getCurrentLocation,
      required this.saveLocation,
      required this.geocodingService})
      : super(LocationLoadingState()) {
    on<GetPlacemarkEvent>((event, emit) async {
      emit(LocationLoadingState());
      final placemarks = await geocodingService.getAddress(
          event.userLocation.latitude, event.userLocation.longitude);

      emit(LocationInitialState(placemark: placemarks!));
    });

    on<ChangeLocationTypeButton>((event, emit) {
      final currentState = state as LocationInitialState;

      if (userLocationType == null) {
        userLocationType = event.userLocationType;
        emit(currentState.copyWith(userLocationType: userLocationType));
      }
    });

    on<SaveLocationEvent>((event, emit) async {
      final voidOrFailer = await saveLocation.call(event.userLocation);

      voidOrFailer.fold((l) => null, (r) => emit(LocationSaveState()));
    });

    on<GetSavedLocationEvent>((event, emit) async {
      final voidOrFailer = await getCurrentLocation.call();

      voidOrFailer.fold((l) => null, (r) async {
        userLocation = r;
        placemarks = await geocodingService.getAddress(r.latitude, r.longitude);
      });
      emit(LocationGetSavedState());
    });
  }
}

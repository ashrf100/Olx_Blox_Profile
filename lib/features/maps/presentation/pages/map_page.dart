import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:olx_bloc/core/services/geolocator_service.dart';
import 'package:olx_bloc/core/services/google_maps_servive.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/maps/domain/entities/location.dart';
import 'package:olx_bloc/features/maps/presentation/bloc/maps/maps_bloc.dart';
import 'package:olx_bloc/features/maps/presentation/widgets/maps/map_app_bar.dart';
import 'package:olx_bloc/features/maps/presentation/widgets/maps/map_helper_widget.dart';
import 'package:olx_bloc/injection_container.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late Completer<GoogleMapController> mapController;

  @override
  void initState() {
    super.initState();
    mapController = Completer<GoogleMapController>();
    _initMap();
  }

  _initMap() async {
    UserLocation location = await sl<GeolocatorService>().getCurrentPosition();
    await sl<GoogleMapsService>().goNewCameraPosition(
      location: location,
      mapController: mapController,
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MapsBloc>(context).add(LoadMap());
    return Scaffold(
      appBar: const MapAppBar(),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<MapsBloc, MapsState>(
        builder: (context, state) {
          if (state is MapsLoadingState) {
            return const AppLoadingWidget();
          }
          if (state is MapsLoadedState) {
            return MapHelperWidget(mapController: mapController, state: state);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

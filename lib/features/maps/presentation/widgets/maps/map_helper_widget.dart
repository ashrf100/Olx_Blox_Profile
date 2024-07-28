import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/maps/presentation/bloc/maps/maps_bloc.dart';
import 'package:olx_bloc/features/maps/presentation/widgets/maps/maps_button_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class MapHelperWidget extends StatelessWidget {
  const MapHelperWidget({
    Key? key,
    required this.mapController,
    required this.state,
  }) : super(key: key);

  final Completer<GoogleMapController> mapController;
  final MapsLoadedState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GoogleMap(
          onMapCreated: (GoogleMapController _) {
            mapController.complete(_);
          },
          onTap: (LatLng position) {
            BlocProvider.of<MapsBloc>(context).add(UpdateMapLocation(position));
          },
          initialCameraPosition: CameraPosition(
              target: LatLng(
                  state.userlocation.latitude, state.userlocation.longitude),
              zoom: state.zoom),
          myLocationEnabled: true,
          markers: state.markers.toSet(),
        ),
        MapsButtonWidget(
            onPressed: () {
              if (state.markers.isNotEmpty) {
                TapHelper.navigateToLocation(
                    context, state.userlocation, state.markers);
              } else {
                showSnackbar(
                    context: context,
                    showCloseIcon: true,
                    message:
                        S.of(context).TapOnTheMapToSelectYourDeliveryLocation,
                    isSuccess: false);
              }
            },
            text: S.of(context).Submit.toUpperCase()),
      ],
    );
  }
}

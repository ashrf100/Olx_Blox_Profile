import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart%20';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/maps/domain/entities/location.dart';
import 'package:olx_bloc/features/maps/presentation/bloc/location/location_bloc.dart';
import 'package:olx_bloc/features/maps/presentation/widgets/maps/map_app_bar.dart';
import 'package:olx_bloc/features/maps/presentation/widgets/maps/maps_button_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class MapSection extends StatelessWidget {
  final UserLocation userLocation;
  final List<Marker> markers;

  const MapSection({
    Key? key,
    required this.userLocation,
    required this.markers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        child: GoogleMap(
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          scrollGesturesEnabled: false,
          onTap: (_) {
            // Navigate to map screen.
          },
          mapType: MapType.normal,
          markers: markers.toSet(),
          initialCameraPosition: CameraPosition(
            target: LatLng(
              userLocation.latitude,
              userLocation.longitude,
            ),
            zoom: 16,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/maps/domain/entities/location.dart';
import 'package:olx_bloc/features/maps/presentation/bloc/location/location_bloc.dart';
import 'package:olx_bloc/features/maps/presentation/widgets/loction/location_additionaldata_widge.dart';
import 'package:olx_bloc/features/maps/presentation/widgets/loction/location_button_widget.dart';
import 'package:olx_bloc/features/maps/presentation/widgets/loction/location_place_infro_widget.dart';
import 'package:olx_bloc/features/maps/presentation/widgets/loction/loction_map_widget.dart';
import 'package:olx_bloc/features/maps/presentation/widgets/maps/map_app_bar.dart';
import 'package:olx_bloc/features/maps/presentation/widgets/maps/maps_button_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class LocationPage extends StatelessWidget {
  final UserLocation userLocation;
  final List<Marker> markers;

  const LocationPage({
    Key? key,
    required this.userLocation,
    required this.markers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LocationBloc>(context)
        .add(GetPlacemarkEvent(userLocation: userLocation));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MapAppBar(text: S.of(context).DeliveryLocationInfo),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: BlocConsumer<LocationBloc, LocationState>(
            listener: (context, state) {
              if (state is LocationSaveState) {
                TapHelper.navigateToMainPage(context);
                showSnackbar(
                    context: context,
                    message: S.of(context).YouDeliveryLocationSavedSuccessfully,
                    isSuccess: true);
              }
            },
            builder: (context, state) {
              if (state is LocationLoadingState) {
                return const AppLoadingWidget();
              }
              if (state is LocationInitialState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      MapSection(userLocation: userLocation, markers: markers),
                      PlacesInfoSection(placemark: state.placemark),
                      LocationTypeButton(),
                      const AdditionalDataInput(),
                      const Divider(),
                      MapsButtonWidget(
                        onPressed: () {
                          BlocProvider.of<LocationBloc>(context).add(
                              SaveLocationEvent(userLocation: userLocation));
                        },
                        text: S.of(context).Submit,
                      )
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}

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

class PlacesInfoSection extends StatelessWidget {
  final Placemark placemark;

  const PlacesInfoSection({super.key, required this.placemark});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            PlacesData(
              text: placemark.country.toString(),
              labelText: S.of(context).country,
              context: context,
            ),
          ],
        ),
        Row(
          children: [
            PlacesData(
              text: placemark.subAdministrativeArea.toString(),
              labelText: S.of(context).subAdministrativeArea,
              context: context,
            ),
          ],
        ),
        Row(
          children: [
            PlacesData(
              text: placemark.locality.toString(),
              labelText: S.of(context).locality,
              context: context,
            ),
          ],
        ),
        Row(
          children: [
            PlacesData(
              text: placemark.street.toString(),
              labelText: S.of(context).street,
              context: context,
            ),
          ],
        ),
      ],
    );
  }
}

class PlacesData extends StatelessWidget {
  final String? text;
  final String? labelText;
  final BuildContext context;

  const PlacesData({
    Key? key,
    required this.text,
    required this.labelText,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: TextField(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.primary,
                height: 1.5.h,
              ),
          controller: TextEditingController(text: text),
          decoration: InputDecoration(
            labelText: '$labelText'.toUpperCase(),
            labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.primaryDark,
                  fontWeight: FontWeight.w600,
                ),
          ),
          enabled: false,
        ),
      ),
    );
  }
}

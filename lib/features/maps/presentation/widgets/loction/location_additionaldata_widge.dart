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

class AdditionalDataInput extends StatelessWidget {
  const AdditionalDataInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.sp),
      child: TextField(
        onChanged: (_) {
          //  controller.additionalData.value = value;
        },
        onTapOutside: (event) {},
        maxLines: 3,
        decoration: InputDecoration(
          hintText: S.of(context).AdditionalData,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

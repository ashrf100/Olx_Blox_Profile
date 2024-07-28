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

class LocationTypeButton extends StatefulWidget {
  @override
  State<LocationTypeButton> createState() => _LocationTypeButtonState();
}

bool isHomeActive = false;
bool isWorkActive = false;

class _LocationTypeButtonState extends State<LocationTypeButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MaterialButton(
          color: AppColors.primaryVariant,
          onPressed: () {
            setState(() {
              if (!isWorkActive) {
                isHomeActive ? isHomeActive = false : null;
                isWorkActive = true;
              }
            });
          },
          child: Row(
            children: [
              Icon(
                Icons.work,
                color: isWorkActive
                    ? AppColors.primary
                    : AppColors.primaryDark.withOpacity(0.5),
              ),
              SizedBox(width: 5.w),
              Text(
                S.of(context).work.toUpperCase(),
                style: isWorkActive
                    ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        )
                    : Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.primaryDark.withOpacity(0.5),
                        fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        MaterialButton(
          color: AppColors.primaryVariant,
          child: Row(
            children: [
              Icon(
                Icons.home,
                color: isHomeActive
                    ? AppColors.primary
                    : AppColors.primaryDark.withOpacity(0.5),
              ),
              SizedBox(width: 5.w),
              Text(
                S.of(context).home.toUpperCase(),
                style: isHomeActive
                    ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        )
                    : Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.primaryDark.withOpacity(0.5),
                        fontWeight: FontWeight.w600),
              ),
            ],
          ),
          onPressed: () {
            setState(() {
              if (!isHomeActive) {
                isWorkActive ? isWorkActive = false : null;
                isHomeActive = true;
              }
            });

            /*  BlocProvider.of<LocationBloc>(context).add(ChangeLocationTypeButton(
                userLocationType: UserLocationType.home));*/
          },
        ),
      ],
    );
  }
}

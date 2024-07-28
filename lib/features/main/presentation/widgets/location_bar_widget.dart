import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/maps/presentation/bloc/location/location_bloc.dart';
import 'package:olx_bloc/generated/l10n.dart';

class LocationBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String categoryName;
  final bool isCategory;

  const LocationBarWidget(
      {super.key, required this.categoryName, required this.isCategory});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 20.h,
        child: isCategory
            ? _buildCategoryRow(context)
            : _buildLocationRow(context),
      ),
    );
  }

  Widget _buildLocationRow(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TapHelper.navigateToMaps(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.location_on, color: AppColors.error, size: 20.sp),
          SizedBox(width: 1.0.w),
          Text(
            S.of(context).Deliverto,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.primaryVariant, height: 1.h),
          ),
          SizedBox(width: 3.0.w),
          BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              if (state is LocationGetSavedState) {
                String? locationName = BlocProvider.of<LocationBloc>(context)
                    .placemarks
                    ?.subAdministrativeArea;
                return Text(locationName ?? "",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: AppColors.primaryVariant,
                        height: 1.h,
                        fontWeight: FontWeight.w600));
              } else {
                return const SizedBox();
              }
            },
          ),
          SizedBox(width: 1.0.w),
          Icon(Icons.keyboard_arrow_down,
              color: AppColors.primaryLight, size: 20.sp),
        ],
      ),
    );
  }

  Widget _buildCategoryRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          categoryName.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.primaryVariant, height: 1.h),
        ),
        SizedBox(width: 1.0.w),
        Icon(Icons.keyboard_arrow_down,
            color: AppColors.primaryLight, size: 20.sp),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(20.h);
}

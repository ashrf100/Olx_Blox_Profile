import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/header_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class MapAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  const MapAppBar({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: FittedBox(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: AppColors.primaryDark.withOpacity(0.5),
              ),
              child: HeaderWidget(
                mainAxisAlignment: MainAxisAlignment.center,
                text: text ??
                    S.of(context).TapOnTheMapToSelectYourDeliveryLocation,
              ),
            ),
          ],
        ),
      ),
      leading: _buildBackIcon(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  Container _buildBackIcon() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withOpacity(0.5),
        borderRadius: BorderRadius.circular(45.0),
      ),
      child: const BackButton(
        color: AppColors.primaryVariant,
      ),
    );
  }
}

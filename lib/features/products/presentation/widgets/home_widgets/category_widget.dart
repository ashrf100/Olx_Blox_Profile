import 'package:cached_network_image/cached_network_image.dart%20';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/CustomCachedNetworkImage.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryName;
  final String categoryImage;
  final void Function()? onTap;

  const CategoryWidget({
    super.key,
    required this.categoryName,
    required this.categoryImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    print(" MediaQuery${MediaQuery.of(context).size.width}");
    return InkWell(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              children: [
                CustomCachedNetworkImage(
                  imageUrl: categoryImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  bottom: 0.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    height: constraints.maxHeight / 4,
                    color: AppColors.primaryDark.withOpacity(0.8),
                    child: Center(
                      child: FittedBox(
                        child: Text(categoryName.toUpperCase(),
                            softWrap: false,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    fontSize: constraints.maxWidth / 9,
                                    color: AppColors.primaryVariant,
                                    fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart ';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/generated/l10n.dart';

class SearchField extends StatelessWidget {
  final Function(String)? onSearch;
  final VoidCallback onTap;
  final bool isTextField;
  final FocusNode? focusNode;
  const SearchField(
      {Key? key,
      required this.onTap,
      this.isTextField = false,
      this.focusNode,
      required this.onSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
          shadowColor: AppColors.primaryLight,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: 32.h,
            color: AppColors.primaryVariant,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: AppColors.primary,
                    size: 20.sp,
                  ),
                  SizedBox(width: 5.w),
                  isTextField
                      ? Expanded(
                          child: TextField(
                            scrollPadding: EdgeInsets.zero,
                            focusNode: focusNode,
                            onSubmitted: onSearch,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: AppColors.primary, height: 1.2.h),
                            ),
                          ),
                        )
                      : Text(
                          S.of(context).Search,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: AppColors.primary, height: 1.2.h),
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/main/presentation/widgets/location_bar_widget.dart';
import 'package:olx_bloc/features/main/presentation/widgets/logo_widget.dart';
import 'package:olx_bloc/features/main/presentation/widgets/search_field_widget.dart';
import 'package:olx_bloc/features/products/presentation/bloc/search/search_bloc.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String categoryName;
  final bool isCategory;
  final bool isSearch;

  const MyAppBar({
    Key? key,
    this.isCategory = false,
    this.categoryName = "",
    this.isSearch = false,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(isSearch ? 50.h : 80.h);

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = FocusNode();

    // Request focus if the search bar is active
    if (isSearch) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => focusNode.requestFocus());
    }

    return AppBar(
      backgroundColor: AppColors.primaryDark,
      elevation: 0.0,
      bottom: _buildBottomWidget(),
      leadingWidth: 80.w,
      leading: isSearch ? null : const LogoWidget(),
      title: _buildTitle(context, focusNode),
    );
  }

  PreferredSizeWidget? _buildBottomWidget() {
    return isSearch
        ? null
        : LocationBarWidget(
            categoryName: categoryName,
            isCategory: isCategory,
          );
  }

  Widget _buildTitle(BuildContext context, FocusNode focusNode) {
    return SearchField(
      onSearch: isSearch
          ? (searchText) {
              BlocProvider.of<SearchBloc>(context).add(GetSearchProductsEvent(
                  searchText: searchText, context: context));
            }
          : null,
      onTap: isSearch
          ? () {}
          : () {
              TapHelper.navigateToSearchPage(context);
            },
      isTextField: isSearch,
      focusNode: isSearch ? focusNode : null,
    );
  }
}

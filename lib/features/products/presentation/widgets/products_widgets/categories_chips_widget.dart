import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart%20';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/products/presentation/bloc/products/products_bloc.dart';

class CategoriesChipsWidget extends StatelessWidget {
  final List<String> categories;
  final String currentCategory;

  const CategoriesChipsWidget(
      {super.key, required this.categories, required this.currentCategory});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: const Color.fromARGB(255, 19, 121, 133),
        indicatorWeight: 3.0,
        onTap: (index) async {
          BlocProvider.of<ProductsBloc>(context).add(
              ProductsChangeCategoryEvent(
                  currentCategory: categories[index], context: context));
        },
        tabs: List.generate(
            categories.length, (index) => _buildTab(index, context)),
      ),
    );
  }

  Tab _buildTab(int index, BuildContext context) {
    return Tab(
      child: Text(
        categories[index].toUpperCase(),
        style: currentCategory == categories[index]
            ? Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                )
            : Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.primary,
                ),
      ),
    );
  }
}

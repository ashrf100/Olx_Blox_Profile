import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/products/presentation/bloc/search/search_bloc.dart';

class RecentSearchWidget extends StatelessWidget {
  final List<String> recentSearch;
  const RecentSearchWidget({super.key, required this.recentSearch});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
        itemCount: recentSearch.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              BlocProvider.of<SearchBloc>(context).add(GetSearchProductsEvent(
                  searchText: recentSearch[index], context: context));
            },
            title: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Text(
                recentSearch[index],
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.primaryDark),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.close, color: AppColors.primaryDark),
              onPressed: () {
                
              },
            ),
          );
        },
      ),
    );
  }
}

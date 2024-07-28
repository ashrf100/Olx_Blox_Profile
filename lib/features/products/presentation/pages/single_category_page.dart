import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';

import 'package:olx_bloc/features/main/presentation/widgets/my_app_bar.dart';
import 'package:olx_bloc/features/products/presentation/bloc/category/category_bloc.dart';

import 'package:olx_bloc/features/products/presentation/widgets/products_widgets/products_settings_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/products_widgets/products_view_widget.dart';

class SingleCategoryPage extends StatelessWidget {
  final String categoryName;

  const SingleCategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    _onstart(context);
    return Scaffold(
        appBar: MyAppBar(isCategory: true, categoryName: categoryName),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoadingState) {
              return const AppLoadingWidget(size: 25);
            } else if (state is CategoryErorrState) {
              return AppErrorWidget(
                  message: state.msg, onPressed: () => _onstart(context));
            } else if (state is CategoryInitialState) {
              return RefreshIndicator(
                onRefresh: () => _onstart(context),
                child: SafeArea(
                  child: Column(
                    children: [
                      ProductsSettingsWidget(
                          isGridMode: state.isGridMode,
                          onPressed: () => _onChangeToggleView(context)),
                      const Divider(),
                      ProductsViewWidget(
                        contextType: ProductsViewContext.category,
                        products: state.products,
                        isloading: state.isloading,
                        isGridMode: state.isGridMode,
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }

  void _onChangeToggleView(BuildContext context) {
    BlocProvider.of<CategoryBloc>(context)
        .add(CategoryChangetoggleViewModeEvent());
  }

  Future<void> _onstart(BuildContext context) async {
    BlocProvider.of<CategoryBloc>(context)
        .add(CategoryInitEvent(categoryName: categoryName, context: context));
  }
}

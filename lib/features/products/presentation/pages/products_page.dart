import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/products/presentation/bloc/products/products_bloc.dart';
import 'package:olx_bloc/features/products/presentation/widgets/products_widgets/categories_chips_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/products_widgets/products_view_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/products_widgets/products_settings_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    onStart(context);

    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsInitState) {
          return Column(
            children: [
              CategoriesChipsWidget(
                  categories: state.categories,
                  currentCategory: state.currentCategory),
              ProductsSettingsWidget(
                  isGridMode: state.isGridMode,
                  onPressed: () => _onChangeToggleView(context)),
              const Divider(),
              ProductsViewWidget(
                products: state.products,
                isloading: state.isloading,
                isGridMode: state.isGridMode,
                contextType: ProductsViewContext.products,
              ),
            ],
          );
        }
        if (state is ProductsloadingState) {
          return AppLoadingWidget(size: 25);
        }
        if (state is ProductsErrorState) {
          return AppErrorWidget(
              message: state.msg,
              onPressed: () {
                onStart(context);
              });
        } else {
          return const SizedBox();
        }
      },
    );
  }

  void onStart(BuildContext context) {
    BlocProvider.of<ProductsBloc>(context)
        .add(ProductsStartEvent(context: context));
  }

  void _onChangeToggleView(BuildContext context) {
    BlocProvider.of<ProductsBloc>(context)
        .add(ProductsChangetoggleViewModeEvent());
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<ProductsBloc>(context)
        .add(ProductsStartEvent(context: context));
  }
}

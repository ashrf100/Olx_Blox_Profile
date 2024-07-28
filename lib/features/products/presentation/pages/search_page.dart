import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/main/presentation/widgets/my_app_bar.dart';
import 'package:olx_bloc/features/products/presentation/bloc/search/search_bloc.dart';
import 'package:olx_bloc/features/products/presentation/widgets/products_widgets/products_settings_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/products_widgets/products_view_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/search_widgets/recent_search_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchBloc>(context).add(SearchInitEvent());
    return Scaffold(
      appBar: const MyAppBar(isSearch: true),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoadingState) {
            return AppLoadingWidget(size: 25);
          } else if (state is SearchErrorstate) {
            return AppErrorWidget(message: state.msg, onPressed: () {});
          } else if (state is SearchInitialState &&
              state.recentSearch.isNotEmpty) {
            return RecentSearchWidget(recentSearch: state.recentSearch);
          } else if (state is SearchSuccessState) {
            return Column(
              children: [
                ProductsSettingsWidget(isGridMode: true, onPressed: () {}),
                ProductsViewWidget(
                    contextType: ProductsViewContext.search,
                    products: state.products,
                    isloading: false,
                    isGridMode: true)
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/bloc/category/category_bloc.dart';
import 'package:olx_bloc/features/products/presentation/bloc/products/products_bloc.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/grid_product_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/list_product_widget.dart';

enum ProductsViewContext { products, category, search }

class ProductsViewWidget extends StatefulWidget {
  final List<Product> products;
  final bool isloading;
  final bool isGridMode;
  final ProductsViewContext contextType;

  const ProductsViewWidget({
    super.key,
    required this.products,
    required this.isloading,
    this.isGridMode = true,
    required this.contextType,
  });

  @override
  State<ProductsViewWidget> createState() => _ProductsViewWidgetState();
}

Map<ProductsViewContext, ScrollController> scrollControllers = {};

class _ProductsViewWidgetState extends State<ProductsViewWidget> {
  @override
  void initState() {
    scrollControllers[widget.contextType] = ScrollController();
    scrollControllers[widget.contextType]!.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollControllers[widget.contextType]!
      ..removeListener(scrollListener)
      ..dispose();
    super.dispose();
  }

  scrollListener() {
    if (widget.contextType == ProductsViewContext.category) {
      if (scrollControllers[widget.contextType]!.position.pixels ==
              scrollControllers[widget.contextType]!.position.maxScrollExtent &&
          widget.isloading == false) {
        BlocProvider.of<CategoryBloc>(context)
            .add(CategoryLoadmoreEvent(context: context));
      }
    }
    if (widget.contextType == ProductsViewContext.products) {
      if (scrollControllers[widget.contextType]!.position.pixels ==
              scrollControllers[widget.contextType]!.position.maxScrollExtent &&
          widget.isloading == false) {
        BlocProvider.of<ProductsBloc>(context)
            .add(ProductsLoadmoreEvent(context: context));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Column(
          children: [
            Expanded(
                child: widget.isGridMode ? _buildGridList() : _buildList()),
            if (widget.isloading) _buildLoadingIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: widget.products.length,
      controller: _getScrollController(),
      itemBuilder: (context, index) {
        return _buildListItem(widget.products[index]);
      },
    );
  }

  Widget _buildListItem(Product product) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: InkWell(
        onTap: () {
          TapHelper.navigateToProductInfo(context, product);
        },
        child: ListProductWidget(
          onTap: () {
            TapHelper.addToCart(context, product, 1);
          },
          product: product,
        ),
      ),
    );
  }

  Widget _buildGridList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.55.w,
      ),
      controller: _getScrollController(),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        return _buildGridItem(widget.products[index]);
      },
    );
  }

  Widget _buildGridItem(Product product) {
    return InkWell(
      onTap: () {
        TapHelper.navigateToProductInfo(context, product);
      },
      child: GridProductWidget(
        onTap: () {
          TapHelper.addToCart(context, product, 1);
        },
        product: product,
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.h),
      child: Center(
        child: AppLoadingWidget(
          size: 25.w,
        ),
      ),
    );
  }

  ScrollController _getScrollController() {
    return scrollControllers[widget.contextType]!;
  }
}

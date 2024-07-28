import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/bloc/home/home_bloc.dart';
import 'package:olx_bloc/features/products/presentation/widgets/Product_info_widgets/Product_Info_thumbnail_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/Product_info_widgets/product_info_addtocart.dart';
import 'package:olx_bloc/features/products/presentation/widgets/Product_info_widgets/product_info_slider_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/Product_info_widgets/product_info_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/suggested_products_widget.dart';

class ProductInfoPage extends StatelessWidget {
  final Product product;

  const ProductInfoPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = BlocProvider.of<HomeBloc>(context).homeProductsList;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: <Widget>[
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 10.h),
                ProductInfoThumbnail(product: product),
                ProductInfoWidget(product: product),
                ProductInfoAddToCart(product: product),
                SizedBox(height: 10.h),
                if (products != null)
                  SuggestedProductsWidget(products: products),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: _buildBackIcon(),
      expandedHeight: 330.0.h,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: ProductInfoSlider(product: product),
      ),
    );
  }

  Container _buildBackIcon() {
    return Container(
      margin: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withOpacity(0.5),
        borderRadius: BorderRadius.circular(45.r),
      ),
      child: const BackButton(color: AppColors.primaryVariant),
    );
  }
}

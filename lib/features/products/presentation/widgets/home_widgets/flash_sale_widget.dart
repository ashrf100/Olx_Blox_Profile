import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/helper/tap_helper.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/widgets/home_widgets/header_widget.dart';
import 'package:olx_bloc/features/products/presentation/widgets/shared_widgets/grid_product_widget.dart';
import 'package:olx_bloc/generated/l10n.dart';

class FlashSaleWidget extends StatelessWidget {
  final List<Product> products;

  const FlashSaleWidget({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          SizedBox(height: 10.h),
          const FlashSaleHeader(),
          ProductList(products: products),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.primary, AppColors.primaryVariant],
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, pageIndex, realIndex) {
        return _buildGridView(pageIndex);
      },
      options: CarouselOptions(
        height: 200.h,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 400),
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
      ),
      itemCount: 10,
    );
  }

  GridView _buildGridView(int pageIndex) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7.h,
        mainAxisSpacing: 5.w,
        crossAxisSpacing: 5.h,
      ),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        final product = products[pageIndex * 2 + index * 5];

        return InkWell(
          onTap: () {
            TapHelper.navigateToProductInfo(
                context, products[pageIndex * 2 + index * 5]);
          },
          child: GridProductWidget(
            showBanner: false,
            showButton: false,
            onTap: () {},
            product: product,
          ),
        );
      },
    );
  }
}

class FlashSaleHeader extends StatefulWidget {
  const FlashSaleHeader({Key? key}) : super(key: key);

  @override
  State<FlashSaleHeader> createState() => _FlashSaleHeaderState();
}

int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 60 * 2;

class _FlashSaleHeaderState extends State<FlashSaleHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        HeaderWidget(text: S.of(context).FlashSale),
        SizedBox(width: 5.w),
        CountdownTimer(
          endTime: endTime,
          widgetBuilder: (_, CurrentRemainingTime? time) {
            if (time == null) {
              return Text('Sale ended', style: TextStyle(fontSize: 20.sp));
            } else {
              return Row(
                children: <Widget>[
                  _buildTimerContainer(context, '${time.hours ?? '00'} '),
                  Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: const Text(':',
                        style: TextStyle(
                          color: AppColors.primaryVariant,
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                  _buildTimerContainer(context, '${time.min ?? '00'} '),
                  Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: const Text(':',
                        style: TextStyle(
                          color: AppColors.primaryVariant,
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                  _buildTimerContainer(context, '${time.sec ?? '00'} '),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Container _buildTimerContainer(BuildContext context, String text) {
    return Container(
      width: 30.w,
      height: 30.h,
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: AppColors.primaryDark.withOpacity(0.8),
        borderRadius: BorderRadius.circular(5),
      ),
      child: FittedBox(
        fit: BoxFit.none,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.primaryVariant,
                fontWeight: FontWeight.w800,
              ),
        ),
      ),
    );
  }
}

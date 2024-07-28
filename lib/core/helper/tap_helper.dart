import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:olx_bloc/core/const/app_routes.dart';
import 'package:olx_bloc/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:olx_bloc/features/maps/domain/entities/location.dart';
import 'package:olx_bloc/features/maps/presentation/bloc/location/location_bloc.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/presentation/bloc/product_info/product_info_cubit.dart';

class TapHelper {
  static void navigateToMapsOrLocation(BuildContext context) {
    final userLocation = BlocProvider.of<LocationBloc>(context).userLocation;

    if (userLocation != null) {
      navigateToLocation(context, userLocation, [
        Marker(
          markerId: const MarkerId("SAVED"),
          position: LatLng(userLocation.latitude, userLocation.longitude),
        ),
      ]);
    } else {
      Navigator.pushNamed(context, AppRoutes.maps);
    }
  }

  static void navigateToProductInfo(BuildContext context, Product product) {
    Navigator.pushNamed(context, AppRoutes.productInfo, arguments: product);
  }

  static void navigateToSignupPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signup);
  }

  static void navigateToMaps(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.maps);
  }

  static void navigateToSearchPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.search);
  }

  static void navigateToAuthPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.auth, (route) => false);
  }

  static void navigateToLandingPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.landing, (route) => false);
  }

  static void navigateToSplashPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.splash, (route) => false);
  }

  static void navigateToMainPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.main, (route) => false);
  }

  static void navigateToSingleCategory(
      BuildContext context, String categoryName) {
    Navigator.pushNamed(context, AppRoutes.singleCategory,
        arguments: categoryName);
  }

  static void navigateToCategories(
      BuildContext context, List<String> categoryName, List<Product> products) {
    Navigator.pushNamed(context, AppRoutes.categories,
        arguments: {'categoryName': categoryName, 'products': products});
  }

  static void navigateToLocation(
      BuildContext context, UserLocation userLocation, List<Marker> markers) {
    Navigator.pushNamed(context, AppRoutes.location,
        arguments: {'userLocation': userLocation, 'markers': markers});
  }

  static void addToCart(BuildContext context, Product product, int quantity) {
    BlocProvider.of<CartBloc>(context).add(
        AddToCartEvent(product: product, quantity: quantity, context: context));
  }

  static void onTapThumbnail(BuildContext context, int index) {
    context.read<ProductInfoCubit>().updatePageIndex(index);
    context.read<ProductInfoCubit>().carouselController.animateToPage(index);
  }

  static void onProductInfoSliderChanged(int index, BuildContext context) {
    context.read<ProductInfoCubit>().updatePageIndex(index);
  }

  static void onDecrementButton(BuildContext context) {
    context.read<ProductInfoCubit>().decrementQuantity();
  }

  static void onIncrementButton(BuildContext context) {
    context.read<ProductInfoCubit>().incrementQuantity();
  }
}









/*
class TapHelper {
  static void navigateToProductInfo(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductInfoPage(product: product)),
    );
  }

  static void navigateToSignupPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpWidget()),
    );
  }

  static void navigateToSearchPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchPage()),
    );
  }

  static void navigateToAuthPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => AuthPage()),
      (route) => false,
    );
  }

  static void navigateToSplashPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SplashPage()),
      (route) => false,
    );
  }

  static void navigateToMainPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
      (route) => false,
    );
  }

  static void navigateToSingleCategory(
      BuildContext context, String categoryName) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SingleCategoryPage(categoryName: categoryName)),
    );
  }

  static void navigateToCategories(
      BuildContext context, List<String> categoryName, List<Product> products) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              CategoriesPage(categoryName: categoryName, products: products)),
    );
  }

  static void addToCart(BuildContext context, Product product, int quantity) {
    BlocProvider.of<CartBloc>(context).add(
        AddToCartEvent(product: product, quantity: quantity, context: context));
  }

  static void onTapThumbnail(BuildContext context, int index) {
    context.read<ProductInfoCubit>().updatePageIndex(index);
    context.read<ProductInfoCubit>().carouselController.animateToPage(index);
  }

  static void onProductInfoSliderChanged(int index, BuildContext context) {
    context.read<ProductInfoCubit>().updatePageIndex(index);
  }

  static void onDecrementButton(BuildContext context) {
    context.read<ProductInfoCubit>().decrementQuantity();
  }

  static void onIncrementButton(BuildContext context) {
    context.read<ProductInfoCubit>().incrementQuantity();
  }
}*/

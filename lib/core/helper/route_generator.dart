// route_generator.dart
import 'package:flutter/material.dart';
import 'package:olx_bloc/core/const/app_routes.dart';
import 'package:olx_bloc/features/main/presentation/pages/obnboarding_page.dart';
import 'package:olx_bloc/features/maps/presentation/pages/location_screen.dart';
import 'package:olx_bloc/features/maps/presentation/pages/map_page.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/auth/presentation/pages/auth_page.dart';
import 'package:olx_bloc/features/main/presentation/pages/main_page.dart';
import 'package:olx_bloc/features/main/presentation/pages/splash_page.dart';
import 'package:olx_bloc/features/products/presentation/pages/categories_page.dart';
import 'package:olx_bloc/features/products/presentation/pages/search_page.dart';
import 'package:olx_bloc/features/products/presentation/pages/single_category_page.dart';
import 'package:olx_bloc/features/products/presentation/pages/product_info_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case AppRoutes.main:
        return MaterialPageRoute(builder: (_) => MainPage());
      case AppRoutes.landing:
        return MaterialPageRoute(builder: (_) => OnboardingPage());
      case AppRoutes.auth:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case AppRoutes.search:
        return MaterialPageRoute(builder: (_) => const SearchPage());
      case AppRoutes.maps:
        return MaterialPageRoute(builder: (_) => const MapPage());

      case AppRoutes.productInfo:
        if (args is Product) {
          return MaterialPageRoute(
              builder: (_) => ProductInfoPage(product: args));
        }
        return _errorRoute();
      case AppRoutes.singleCategory:
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => SingleCategoryPage(categoryName: args));
        }
        return _errorRoute();
      case AppRoutes.categories:
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
              builder: (_) => CategoriesPage(
                  categoryName: args['categoryName'],
                  products: args['products']));
        }

        return _errorRoute();
      case AppRoutes.location:
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
              builder: (_) => LocationPage(
                    markers: args['markers'],
                    userLocation: args['userLocation'],
                  ));
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found!')),
      );
    });
  }
}

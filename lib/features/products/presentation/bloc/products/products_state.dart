part of 'products_bloc.dart';

@immutable
abstract class ProductsState {}

class ProductsInitState extends ProductsState {
  final List<Product> products;
  final List<String> categories;
  final String msg;
  final bool isGridMode;
  final String currentCategory;
  final bool isloading;

  ProductsInitState({
    this.currentCategory = "all products",
    this.products = const [],
    this.categories = const [],
    this.msg = "",
    this.isGridMode = true,
    this.isloading = false,
  });

  ProductsInitState copyWith(
      {List<Product>? products,
      List<String>? categories,
      String? msg,
      AppState? appState,
      bool? isGridMode,
      String? currentCategory,
      bool? isloading}) {
    return ProductsInitState(
        products: products ?? this.products,
        categories: categories ?? this.categories,
        msg: msg ?? this.msg,
        isGridMode: isGridMode ?? this.isGridMode,
        currentCategory: currentCategory ?? this.currentCategory,
        isloading: isloading ?? this.isloading);
  }
}

class ProductsloadingState extends ProductsState {}

class ProductsErrorState extends ProductsState {
  final String msg;

  ProductsErrorState({required this.msg}); 
}

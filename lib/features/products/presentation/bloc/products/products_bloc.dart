import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:olx_bloc/core/error/failures_msg.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/domain/usecase/products_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  final GetAppProductsUseCase getAppProductsUseCase;
  final GetAppCategoriesUseCase getAppCategoriesUseCase;

  ProductsBloc({
    required this.getAppCategoriesUseCase,
    required this.getHomeDataUseCase,
    required this.getAppProductsUseCase,
  }) : super(ProductsloadingState()) {
    on<ProductsStartEvent>(_onProductsStartEvent);
    on<ProductsChangetoggleViewModeEvent>(_onProductsChangeToggleViewModeEvent);
    on<ProductsChangeCategoryEvent>(_onProductsChangeCategoryEvent);
    on<ProductsLoadmoreEvent>(_onProductsLoadMoreEvent);
  }

  Future<void> _onProductsStartEvent(
      ProductsStartEvent event, Emitter<ProductsState> emit) async {
    final failureOrProducts = await getHomeDataUseCase(limit: 10);
    failureOrProducts.fold(
      (failure) => emit(
          ProductsErrorState(msg: mapFailureToMessage(failure, event.context))),
      (tuple2) {
        final List<Product> productsList = tuple2.value1;
        final List<String> categoriesList = tuple2.value2;
        categoriesList.insert(0, "all products");
        emit(ProductsInitState(
            products: productsList, categories: categoriesList));
      },
    );
  }

  void _onProductsChangeToggleViewModeEvent(
      ProductsChangetoggleViewModeEvent event, Emitter<ProductsState> emit) {
    final currentState = state as ProductsInitState;
    final newIsGridMode = !currentState.isGridMode;
    emit(currentState.copyWith(isGridMode: newIsGridMode));
  }

  Future<void> _onProductsChangeCategoryEvent(
      ProductsChangeCategoryEvent event, Emitter<ProductsState> emit) async {
    final currentState = state as ProductsInitState;
    final newCurrentCategory = event.currentCategory;
    final failureOrProducts = await getAppProductsUseCase(
        limit: 10, skip: 0, categoryName: newCurrentCategory);
    failureOrProducts.fold(
      (failure) => emit(
          ProductsErrorState(msg: mapFailureToMessage(failure, event.context))),
      (product) {
        final List<Product> productsList = product;
        emit(currentState.copyWith(
            products: productsList, currentCategory: newCurrentCategory));
      },
    );
  }

  Future<void> _onProductsLoadMoreEvent(
      ProductsLoadmoreEvent event, Emitter<ProductsState> emit) async {
    final currentState = state as ProductsInitState;

    emit(currentState.copyWith(isloading: true));

    final failureOrProducts = await getAppProductsUseCase(
        limit: 10,
        skip: currentState.products.length,
        categoryName: currentState.currentCategory);
    failureOrProducts.fold(
      (failure) => emit(
          ProductsErrorState(msg: mapFailureToMessage(failure, event.context))),
      (product) {
        final List<Product> productsList = currentState.products;
        productsList.addAll(product);
        emit(currentState.copyWith(
          products: productsList,
          isloading: false,
        ));
      },
    );
  }
}

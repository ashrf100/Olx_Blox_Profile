import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:olx_bloc/core/error/failures_msg.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/domain/usecase/products_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetAppProductsUseCase getAppProductsUseCase;

  bool isGridMode = true;
  List<Product> productsList = [];
  String categoryName = "";

  CategoryBloc({required this.getAppProductsUseCase})
      : super(CategoryLoadingState()) {
    on<CategoryInitEvent>((event, emit) async {
      emit(CategoryLoadingState());
      categoryName = event.categoryName;
      final failureOrProducts = await getAppProductsUseCase(
          limit: 10, skip: 0, categoryName: event.categoryName);
      failureOrProducts.fold(
        (failure) {
          emit(CategoryErorrState(
              msg: mapFailureToMessage(failure, event.context)));
        },
        (product) {
          productsList = product;
          emit(CategoryInitialState(
              products: productsList,
              isGridMode: isGridMode,
              isloading: false));
        },
      );
    });

    on<CategoryLoadmoreEvent>((event, emit) async {
      emit(CategoryInitialState(
          products: productsList, isGridMode: isGridMode, isloading: true));
      final failureOrProducts = await getAppProductsUseCase(
          limit: 10, skip: productsList.length, categoryName: categoryName);
      failureOrProducts.fold(
        (failure) {
          emit(CategoryErorrState(
              msg: mapFailureToMessage(failure, event.context)));
        },
        (product) {
          productsList.addAll(product);
          emit(CategoryInitialState(
              products: productsList,
              isGridMode: isGridMode,
              isloading: false));
        },
      );
    });

    on<CategoryChangetoggleViewModeEvent>((event, emit) {
      isGridMode = !isGridMode;
      emit(CategoryInitialState(
          products: productsList, isGridMode: isGridMode, isloading: false));
    });
  }
}

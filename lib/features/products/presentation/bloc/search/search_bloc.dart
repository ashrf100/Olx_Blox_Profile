import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:olx_bloc/core/error/failures_msg.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/domain/usecase/products_usecase.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetAppSearchProductsUseCase getAppSearchProductsUseCase;
  final GetCachedRecentSearchUseCase getCachedRecentSearch;
  SearchBloc(
      {required this.getAppSearchProductsUseCase,
      required this.getCachedRecentSearch})
      : super(SearchLoadingState()) {
    on<SearchInitEvent>((event, emit) async {
      final failureOrSearchTexts = await getCachedRecentSearch();
      failureOrSearchTexts.fold(
          (failure) => emit(const SearchInitialState(recentSearch: [])),
          (searchTexts) => emit(SearchInitialState(recentSearch: searchTexts)));
    });

    on<GetSearchProductsEvent>((event, emit) async {
      emit(SearchLoadingState());
      final failureOrProducts =
          await getAppSearchProductsUseCase(searchText: event.searchText);
      failureOrProducts.fold(
          (failure) => emit(SearchErrorstate(
              msg: mapFailureToMessage(failure, event.context))), (products) {
        if (products.isNotEmpty) {
          emit(SearchSuccessState(products: products));
        } else {
          emit(const SearchErrorstate(
              msg: " Sorry, no products matched your search text"));
        }
      });
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:olx_bloc/core/error/failures_msg.dart';
import 'package:olx_bloc/features/products/domain/entities/products.dart';
import 'package:olx_bloc/features/products/domain/usecase/products_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  List<Product>? homeProductsList;
  List<String>? homeCategoriesList;
  int widgetsLength = 2;

  HomeBloc({required this.getHomeDataUseCase}) : super(LoadingHomeState()) {
    on<HomeInitEvent>((event, emit) async {
      final failureOrProducts = await getHomeDataUseCase(limit: 100);
      failureOrProducts.fold(
        (failure) {
          emit(ErrorHomeState(
            msg: mapFailureToMessage(failure, event.context),
          ));
        },
        (tuple2) {
          homeProductsList = tuple2.value1;
          homeCategoriesList = tuple2.value2;

          emit(InitHomeState(
            products: homeProductsList!,
            categories: homeCategoriesList!,
            widgetsLength: widgetsLength,
          ));
        },
      );
    });

    on<LoadNextSectionEvent>((event, emit) {
      if (widgetsLength <= event.widgetsLength - 1) {
        widgetsLength++;
        final currentState = state as InitHomeState;
        emit(currentState.copyWith(
          products: homeProductsList!,
          categories: homeCategoriesList!,
          widgetsLength: widgetsLength,
        ));
      }
    });
  }
}

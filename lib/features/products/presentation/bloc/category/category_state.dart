part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitialState extends CategoryState {
  final List<Product> products;
  final bool isGridMode;
  final bool isloading;

  CategoryInitialState(
      {required this.isGridMode,
      required this.isloading,
      required this.products});
}

final class CategoryErorrState extends CategoryState {
  final String msg;

  CategoryErorrState({required this.msg});
}

final class CategoryLoadingState extends CategoryState {}

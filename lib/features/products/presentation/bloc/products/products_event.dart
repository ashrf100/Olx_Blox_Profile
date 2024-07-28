part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

final class ProductsStartEvent extends ProductsEvent {
  final BuildContext context;

  ProductsStartEvent({required this.context});
}

final class ProductsLoadmoreEvent extends ProductsEvent {
  final BuildContext context;

  ProductsLoadmoreEvent({required this.context});
}

final class ProductsChangeCategoryEvent extends ProductsEvent {
  final String currentCategory;
  final BuildContext context;

  ProductsChangeCategoryEvent(
      {required this.currentCategory, required this.context});
}

final class ProductsChangetoggleViewModeEvent extends ProductsEvent {}

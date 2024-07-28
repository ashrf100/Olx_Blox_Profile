part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class CategoryInitEvent extends CategoryEvent {
  final String categoryName;
  final BuildContext context;

  CategoryInitEvent({required this.context, required this.categoryName});
}

class CategoryLoadmoreEvent extends CategoryEvent {
  final BuildContext context;

  CategoryLoadmoreEvent({required this.context});
}

class CategoryChangetoggleViewModeEvent extends CategoryEvent {}

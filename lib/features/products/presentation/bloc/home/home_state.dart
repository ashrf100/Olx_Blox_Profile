// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class InitHomeState extends HomeState {
  final List<Product> products;
  final List<String> categories;
  final int widgetsLength;

  InitHomeState(
      {required this.products,
      required this.categories,
      required this.widgetsLength});

  InitHomeState copyWith({
    List<Product>? products,
    List<String>? categories,
    int? widgetsLength,
  }) {
    return InitHomeState(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      widgetsLength: widgetsLength ?? this.widgetsLength,
    );
  }
}

class ErrorHomeState extends HomeState {
  final String msg;

  ErrorHomeState({required this.msg});
}

class LoadingHomeState extends HomeState {}

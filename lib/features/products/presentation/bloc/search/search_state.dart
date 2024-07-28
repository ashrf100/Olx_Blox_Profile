part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitialState extends SearchState {
  final List<String> recentSearch;

  const SearchInitialState({required this.recentSearch});
}

final class SearchLoadingState extends SearchState {}

final class SearchSuccessState extends SearchState {
  final List<Product> products;

  const SearchSuccessState({required this.products});
}

final class SearchNoProductstate extends SearchState {}

final class SearchErrorstate extends SearchState {
  final String msg;

  const SearchErrorstate({required this.msg});
}

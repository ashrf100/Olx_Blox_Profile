part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchInitEvent extends SearchEvent {}

class GetSearchProductsEvent extends SearchEvent {
  final String searchText;
  final BuildContext context;

  const GetSearchProductsEvent(
      {required this.context, required this.searchText});
}

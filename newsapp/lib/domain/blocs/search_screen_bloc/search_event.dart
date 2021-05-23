import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchNews extends SearchEvent {
  final String query;

  SearchNews(this.query);

  @override
  List<Object> get props => [query];
}

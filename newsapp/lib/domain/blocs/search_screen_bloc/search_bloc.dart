import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/domain/blocs/search_screen_bloc/search_event.dart';
import 'package:newsapp/domain/blocs/search_screen_bloc/search_state.dart';
import 'package:newsapp/domain/repositories/news_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final NewsRepository _repository;

  SearchBloc(this._repository) : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchNews) {
      yield* _mapSearchNews(event);
    }
  }

  Stream<SearchState> _mapSearchNews(SearchNews event) async* {
    final articles = await _repository.searchNews(event.query);
    yield NewsFound(articles: articles);
  }
}

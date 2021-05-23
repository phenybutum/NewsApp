import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/domain/blocs/main_screen_bloc/main_screen_event.dart';
import 'package:newsapp/domain/blocs/main_screen_bloc/main_screen_state.dart';
import 'package:newsapp/domain/repositories/categories_repository.dart';
import 'package:newsapp/domain/repositories/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final CategoriesRepository _repository;
  final NewsRepository _newsRepository;

  NewsBloc(this._repository, this._newsRepository) : super(MainScreenInitial());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is LoadCategories) {
      yield* _mapLoadNews(event);
    }
    if (event is LoadNewsFromSource) {
      yield* _mapLoadNewsFromSource(event);
    }
    if (event is LoadNewsFromCategory) {
      yield* _mapLoadNewsFromCategory(event);
    }
  }

  Stream<NewsState> _mapLoadNews(LoadCategories event) async* {
    final categoriesList = _repository.categoriesList();
    final headlines = await _newsRepository.getHeadlines();
    yield MainScreenLoaded(
        categoriesList: categoriesList, headlines: headlines);
  }

  Stream<NewsState> _mapLoadNewsFromSource(LoadNewsFromSource event) async* {
    final headlines = await _newsRepository.getNewsFromSource(event.source);
    yield SourceOverviewScreenLoaded(headlines: headlines);
  }

  Stream<NewsState> _mapLoadNewsFromCategory(
      LoadNewsFromCategory event) async* {
    final headlines = await _newsRepository.getNewsByCategory(event.category);
    yield CategoryOverviewScreenLoaded(headlines: headlines);
  }
}

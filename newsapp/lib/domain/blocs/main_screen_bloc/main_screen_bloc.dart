import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/domain/blocs/main_screen_bloc/main_screen_event.dart';
import 'package:newsapp/domain/blocs/main_screen_bloc/main_screen_state.dart';
import 'package:newsapp/domain/repositories/categories_repository.dart';
import 'package:newsapp/domain/repositories/news_repository.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final CategoriesRepository _repository;
  final NewsRepository _newsRepository;

  MainScreenBloc(this._repository, this._newsRepository) : super(MainScreenInitial());

  @override
  Stream<MainScreenState> mapEventToState(MainScreenEvent event) async* {
    if (event is LoadCategories) {
      yield* _mapLoadNews(event);
    }
  }

  Stream<MainScreenState> _mapLoadNews(LoadCategories event) async* {
    final categoriesList = _repository.categoriesList();
    final headlines = await _newsRepository.getHeadlines();
    yield MainScreenLoaded(categoriesList: categoriesList, headlines: headlines);
  }
}
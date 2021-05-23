import 'package:newsapp/data/api/news/news_service.dart';
import 'package:newsapp/data/entities/article/article_model.dart';
import 'package:newsapp/data/entities/source/source_model.dart';

class NewsRepository {
  final NewsService _service;

  NewsRepository(this._service);

  Future<List<Article>> getHeadlines() => _service.getHeadlines();
  Future<List<Article>> getNewsByCategory(String category) => _service.getNewsByCategory(category);
  Future<List<Article>> getNewsFromSource(Source source) => _service.getNewsFromSource(source);


}
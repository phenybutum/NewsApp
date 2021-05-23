import 'package:newsapp/data/entities/article/article_model.dart';
import 'package:newsapp/data/entities/source/source_model.dart';

abstract class NewsService {
  Future<List<Article>> getHeadlines();
  Future<List<Article>> getNewsByCategory(String category);
  Future<List<Article>> getNewsFromSource(Source source);
}
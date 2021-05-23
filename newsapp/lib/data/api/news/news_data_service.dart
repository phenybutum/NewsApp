import 'package:newsapp/data/api/news/news_service.dart';
import 'package:newsapp/data/api/rest/news/article_response_parser.dart';
import 'package:newsapp/data/api/rest/news/news_api.dart';
import 'package:newsapp/data/api/rest/responses/article/articles_list_response.dart';
import 'package:newsapp/data/entities/article/article_model.dart';
import 'package:newsapp/data/entities/source/source_model.dart';

class RESTNewsDataService implements NewsService {
  List<Article> headlines = List();
  List<Article> headlinesFromSource = List();
  List<Article> headlinesFromCategory = List();
  List<Article> searchResults = List();
  final NewsAPI api;

  RESTNewsDataService(this.api);

  @override
  Future<List<Article>> getHeadlines() async {
    headlines.clear();
    ArticlesListResponse artResp = await api.getHeadlines();
    artResp.data.forEach((element) {
      headlines
          .add(ArticleResponseParser(articleResponse: element).parseArticle());
    });
    return headlines;
  }

  @override
  Future<List<Article>> getNewsByCategory(String category) async {
    headlinesFromCategory.clear();
    ArticlesListResponse artResp = await api.getHeadlinesFromCategory(category);
    artResp.data.forEach((element) {
      headlinesFromCategory
          .add(ArticleResponseParser(articleResponse: element).parseArticle());
    });
    return headlinesFromCategory;
  }

  @override
  Future<List<Article>> getNewsFromSource(Source source) async {
    headlinesFromSource.clear();
    ArticlesListResponse artResp = await api.getHeadlinesFromSource(source.id);
    artResp.data.forEach((element) {
      headlinesFromSource
          .add(ArticleResponseParser(articleResponse: element).parseArticle());
    });
    return headlinesFromSource;
  }

  @override
  Future<List<Article>> searchNews(String query) async {
    searchResults.clear();
    ArticlesListResponse artResp = await api.searchNews(query);
    artResp.data.forEach((element) {
      searchResults
          .add(ArticleResponseParser(articleResponse: element).parseArticle());
    });
    return searchResults;
  }
}

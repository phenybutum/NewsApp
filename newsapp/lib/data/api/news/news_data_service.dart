import 'package:newsapp/data/api/news/news_service.dart';
import 'package:newsapp/data/api/rest/news/article_response_parser.dart';
import 'package:newsapp/data/api/rest/news/news_api.dart';
import 'package:newsapp/data/api/rest/responses/article/articles_list_response.dart';
import 'package:newsapp/data/entities/article/article_model.dart';
import 'package:newsapp/data/entities/source/source_model.dart';

class RESTNewsDataService implements NewsService {
  List<Article> headlines = List();
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
  Future<List<Article>> getNewsByCategory() async {
    // TODO: implement getNewsByCategory
    throw UnimplementedError();
  }

  @override
  Future<List<Article>> getNewsFromSource(Source source) async {
    // TODO: implement getNewsFromSource
    throw UnimplementedError();
  }
}
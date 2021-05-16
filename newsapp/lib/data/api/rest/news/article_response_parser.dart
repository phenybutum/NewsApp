import 'package:newsapp/data/api/rest/responses/article/article_response.dart';
import 'package:newsapp/data/entities/article/article_model.dart';

class ArticleResponseParser {
  final ArticleResponse articleResponse;

  ArticleResponseParser({this.articleResponse});

  Article parseArticle() {
    var article;
    article = Article(
      title: articleResponse.title,
      author: articleResponse.author,
      url: articleResponse.url,
      urlToImage: articleResponse.urlToImage,
      source: articleResponse.sourceResponse?.name,
      description: articleResponse.description,
    );
    return article;
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapp/data/api/rest/responses/article/article_response.dart';

class ArticlesListResponse extends Equatable {
  final List<ArticleResponse> data;

  ArticlesListResponse({@required this.data});

  factory ArticlesListResponse.fromJSON(json) {
    final List<dynamic> data = json['articles'];
    var articles = List<ArticleResponse>();

    data.forEach((element) {
      articles.add(ArticleResponse.fromJSON(element));
    });

    return ArticlesListResponse(data: articles);
  }

  @override
  List<Object> get props => [data];
}

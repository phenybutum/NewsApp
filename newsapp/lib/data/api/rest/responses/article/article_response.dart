import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:newsapp/data/api/rest/responses/source/source_response.dart';

class ArticleResponse extends Equatable {
  final SourceResponse sourceResponse;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  ArticleResponse(
      {@required this.sourceResponse,
      @required this.author,
      @required this.title,
      @required this.description,
      @required this.url,
      @required this.urlToImage});

  factory ArticleResponse.fromJSON(json) {
    var sourcesResponse = json['source'] == null
        ? null
        : SourceResponse.fromJSON(json['source']);
    final article = ArticleResponse(
      sourceResponse: sourcesResponse,
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
    return article;
  }

  @override
  List<Object> get props =>
      [author, title, description, url, sourceResponse, urlToImage];
}

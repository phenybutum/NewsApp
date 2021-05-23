import 'package:dio/dio.dart';
import 'package:newsapp/data/api/api_exception.dart';
import 'package:newsapp/data/api/rest/base_rest_api.dart';
import 'package:newsapp/data/api/rest/response_parser.dart';
import 'dart:developer' as developer;

import 'package:newsapp/data/api/rest/responses/article/articles_list_response.dart';

const _headlines = 'top-headlines/';
const _everything = 'everything/';

class NewsAPI extends BaseRestApi {
  NewsAPI(String baseApiEndPoint) : super(baseApiEndPoint);

  Future<ArticlesListResponse> getHeadlines() async {
    Map<String, dynamic> body = {'country': 'us'};
    try {
      var response = await dio.get(_headlines, queryParameters: body);
      return ResponseParser<ArticlesListResponse>()
          .parseItem(response, (json) => ArticlesListResponse.fromJSON(json));
    } on DioError catch (e) {
      developer.log('Failed to load headlines');
      throw APIException(errorMessageFrom(e, "Failed to load headlines"));
    }
  }

  Future<ArticlesListResponse> getHeadlinesFromSource(String source) async {
    Map<String, dynamic> body = {'sources': source};
    try {
      var response = await dio.get(_headlines, queryParameters: body);
      return ResponseParser<ArticlesListResponse>()
          .parseItem(response, (json) => ArticlesListResponse.fromJSON(json));
    } on DioError catch (e) {
      developer.log('Failed to load headlines from source');
      throw APIException(
          errorMessageFrom(e, "Failed to load headlines from source"));
    }
  }

  Future<ArticlesListResponse> getHeadlinesFromCategory(String category) async {
    Map<String, dynamic> body = {'category': category};
    try {
      var response = await dio.get(_headlines, queryParameters: body);
      return ResponseParser<ArticlesListResponse>()
          .parseItem(response, (json) => ArticlesListResponse.fromJSON(json));
    } on DioError catch (e) {
      developer.log('Failed to load headlines from category');
      throw APIException(
          errorMessageFrom(e, "Failed to load headlines from category"));
    }
  }

  Future<ArticlesListResponse> searchNews(String query) async {
    Map<String, dynamic> body = {'q': query};
    try {
      var response = await dio.get(_everything, queryParameters: body);
      return ResponseParser<ArticlesListResponse>()
          .parseItem(response, (json) => ArticlesListResponse.fromJSON(json));
    } on DioError catch (e) {
      developer.log('Failed to find news');
      throw APIException(errorMessageFrom(e, "Failed to find news"));
    }
  }
}

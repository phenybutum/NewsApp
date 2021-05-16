import 'package:dio/dio.dart';
import 'package:newsapp/data/api/api_exception.dart';
import 'package:newsapp/data/api/rest/base_rest_api.dart';
import 'package:newsapp/data/api/rest/response_parser.dart';
import 'dart:developer' as developer;

import 'package:newsapp/data/api/rest/responses/article/articles_list_response.dart';

const _headlines = 'top-headlines/';

class NewsAPI extends BaseRestApi {
  NewsAPI(String baseApiEndPoint) : super(baseApiEndPoint);

  Future<ArticlesListResponse> getHeadlines() async {
    Map<String, dynamic> body = {'country': 'us'};
    try {
      var response = await dio.get(_headlines, queryParameters: body);
      return ResponseParser<ArticlesListResponse>()
          .parseItem(response, (json) => ArticlesListResponse.fromJSON(json));
    } on DioError catch (e) {
      developer.log('Failed to follow event');
      throw APIException(errorMessageFrom(e, "Failed to follow event"));
    }
  }
}

import 'package:dio/dio.dart';
import 'package:newsapp/data/api/api_exception.dart';
import 'package:newsapp/data/api/rest/base_rest_api.dart';
import 'package:newsapp/data/api/rest/response_parser.dart';
import 'package:newsapp/data/api/rest/responses/source/sources_list_respone.dart';
import 'dart:developer' as developer;

const _sources = 'sources/';

class SourcesAPI extends BaseRestApi {
  SourcesAPI(String baseApiEndPoint) : super(baseApiEndPoint);

  Future<SourceListResponse> getSources() async {
    Map<String, dynamic> body = {'country': 'us'};
    try {
      var response = await dio.get(_sources, queryParameters: body);
      return ResponseParser<SourceListResponse>()
          .parseItem(response, (json) => SourceListResponse.fromJSON(json));
    } on DioError catch (e) {
      developer.log('Failed to load sources');
      throw APIException(errorMessageFrom(e, "Failed to load sources"));
    }
  }
}

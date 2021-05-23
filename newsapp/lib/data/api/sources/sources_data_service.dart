import 'package:newsapp/data/api/rest/responses/source/sources_list_respone.dart';
import 'package:newsapp/data/api/rest/sources/source_api.dart';
import 'package:newsapp/data/api/rest/sources/source_response_parser.dart';
import 'package:newsapp/data/api/sources/sources_service.dart';
import 'package:newsapp/data/entities/source/source_model.dart';

class RESTSourcesDataService implements SourcesService {
  List<Source> sources = List();
  final SourcesAPI api;

  RESTSourcesDataService(this.api);

  @override
  Future<List<Source>> getSources() async {
    sources.clear();
    SourceListResponse artResp = await api.getSources();
    artResp.data.forEach((element) {
      sources.add(SourceResponseParser(sourceResponse: element).parseSource());
    });
    return sources;
  }
}

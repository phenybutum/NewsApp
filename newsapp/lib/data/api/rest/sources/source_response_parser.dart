import 'package:newsapp/data/api/rest/responses/source/source_response.dart';
import 'package:newsapp/data/entities/source/source_model.dart';

class SourceResponseParser {
  final SourceResponse sourceResponse;

  SourceResponseParser({this.sourceResponse});

  Source parseSource() {
    var source;
    source = Source(
      name: sourceResponse.name,
      id: sourceResponse.id,
      description: sourceResponse.description,
      url: sourceResponse.url
    );
    return source;
  }
}

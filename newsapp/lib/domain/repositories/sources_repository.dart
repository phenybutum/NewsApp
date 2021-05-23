import 'package:newsapp/data/api/sources/sources_service.dart';
import 'package:newsapp/data/entities/source/source_model.dart';

class SourcesRepository {
  final SourcesService _service;

  SourcesRepository(this._service);

  Future<List<Source>> getSources() => _service.getSources();


}
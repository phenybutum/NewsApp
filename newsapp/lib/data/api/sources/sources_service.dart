import 'package:newsapp/data/entities/source/source_model.dart';

abstract class SourcesService {
  Future<List<Source>> getSources();
}
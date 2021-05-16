import 'package:newsapp/data/api/categories/categories_service.dart';
import 'package:newsapp/data/api/navigation/navigation_data_service.dart';

class CategoriesRepository {
  final CategoriesService _dataService;

  CategoriesRepository(this._dataService);

  List<String> categoriesList() => _dataService.categoriesList();
}

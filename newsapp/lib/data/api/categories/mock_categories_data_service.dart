import 'package:newsapp/data/api/categories/categories_service.dart';
import 'package:easy_localization/easy_localization.dart';

class MockCategoriesDataService implements CategoriesService {
  @override
  List<String> categoriesList() {
    return [
      'business',
      'entertainment',
      'general',
      'health',
      'science',
      'sports',
      'technology',
    ];
  }
}

import 'package:newsapp/data/api/categories/categories_service.dart';
import 'package:easy_localization/easy_localization.dart';

class MockCategoriesDataService implements CategoriesService {
  @override
  List<String> categoriesList() {
    return [
      'business'.tr(),
      'entertainment'.tr(),
      'general'.tr(),
      'health'.tr(),
      'science'.tr(),
      'sports'.tr(),
      'technology'.tr(),
    ];
  }
}

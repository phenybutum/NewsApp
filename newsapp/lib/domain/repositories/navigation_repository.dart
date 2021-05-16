import 'package:newsapp/data/api/navigation/navigation_data_service.dart';

class NavigationRepository {
  final NavigationDataService _dataService;

  NavigationRepository(this._dataService);

  List<BottomBarItem> itemsList() => _dataService.itemsList();
}

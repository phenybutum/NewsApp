import 'package:newsapp/data/api/navigation/navigation_data_service.dart';

class MockNavigationDataService implements NavigationDataService {
  @override
  List<BottomBarItem> itemsList() {
    return [
      BottomBarItem.Main,
      BottomBarItem.Sources,
      BottomBarItem.Search,
    ];
  }
}

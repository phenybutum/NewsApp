enum BottomBarItem { Main, Sources, Search,}

abstract class NavigationDataService {
  List<BottomBarItem> itemsList();
}
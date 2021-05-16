import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/data/api/navigation/navigation_data_service.dart';
import 'package:newsapp/domain/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:newsapp/domain/blocs/navigation_bloc/navigation_event.dart';
import 'package:newsapp/domain/blocs/navigation_bloc/navigation_state.dart';
import 'package:newsapp/presentation/scenes/main_screen/main_screen.dart';
import 'package:newsapp/presentation/scenes/search_screen/search_screen.dart';
import 'package:newsapp/presentation/scenes/sourse_screen/source_screen.dart';
import 'package:newsapp/presentation/styles/neap_colors.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabScreenData {
  Widget screen;
  BottomBarItem type;

  _TabScreenData(this.screen, this.type);
}

class _TabsScreenState extends State<TabsScreen> {
  List<_TabScreenData> _screensData = [];
  int _selectedScreenIndex = 0;

  @override
  void initState() {
    BlocProvider.of<NavigationBloc>(context).add(LoadScreens());
    super.initState();
  }

  void _selectScreen(int index) {
    BlocProvider.of<NavigationBloc>(context)
        .add(OpenBottomBarItem(_screensData[index].type));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, navigationState) {
      if (navigationState is ScreensLoaded) {
        navigationState.screens.forEach((element) {
          switch (element) {
            case BottomBarItem.Main:
              var data = _TabScreenData(MainScreen(), element);
              _screensData.add(data);
              break;
            case BottomBarItem.Sources:
              var data = _TabScreenData(SourcesScreen(), element);
              _screensData.add(data);
              break;
            case BottomBarItem.Search:
              var data = _TabScreenData(SearchScreen(), element);
              _screensData.add(data);
              break;
          }
        });
        return buildUI(context);
      } else if (navigationState is OpenedBottomBarItem) {
        _selectedScreenIndex = _screensData
            .indexWhere((element) => element.type == navigationState.item);
        return buildUI(context);
      }
      return Container();
    });
  }

  Widget buildUI(BuildContext context) => Scaffold(
        body: _screensData[_selectedScreenIndex].screen,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          currentIndex: _selectedScreenIndex,
          backgroundColor: NeapColors.gray,
          selectedFontSize: 10.sp,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey,
          iconSize: 28.w,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            _bottomBarItem(
              icon: Icon(CupertinoIcons.globe),
            ),
            _bottomBarItem(
              icon: Icon(CupertinoIcons.list_bullet),
            ),
            _bottomBarItem(
              icon: Icon(CupertinoIcons.search),
            ),
          ],
        ),
      );

  BottomNavigationBarItem _bottomBarItem({Icon icon}) =>
      BottomNavigationBarItem(title: Text(' '), icon: icon);
}

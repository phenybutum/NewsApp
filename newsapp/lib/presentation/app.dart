import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/data/api/categories/mock_categories_data_service.dart';
import 'package:newsapp/data/api/navigation/mock_navigation_data_service.dart';
import 'package:newsapp/data/api/news/news_data_service.dart';
import 'package:newsapp/data/api/rest/news/news_api.dart';
import 'package:newsapp/domain/blocs/main_screen_bloc/main_screen_bloc.dart';
import 'package:newsapp/domain/blocs/main_screen_bloc/main_screen_event.dart';
import 'package:newsapp/domain/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:newsapp/domain/repositories/categories_repository.dart';
import 'package:newsapp/domain/repositories/navigation_repository.dart';
import 'package:newsapp/domain/repositories/news_repository.dart';
import 'package:newsapp/presentation/scenes/tabs_screen/tabs_screen.dart';
import 'package:newsapp/presentation/styles/design_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const baseApiEndpoint = 'https://newsapi.org/v2/';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NavigationRepository>(
            create: (context) =>
                NavigationRepository(MockNavigationDataService())),
        RepositoryProvider<CategoriesRepository>(
            create: (context) =>
                CategoriesRepository(MockCategoriesDataService())),
        RepositoryProvider<NewsRepository>(
            create: (context) =>
                NewsRepository(RESTNewsDataService(NewsAPI(baseApiEndpoint)))),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBloc>(
            create: (context) => NavigationBloc(
              RepositoryProvider.of<NavigationRepository>(context),
            ),
          ),BlocProvider<MainScreenBloc>(
            create: (context) => MainScreenBloc(
              RepositoryProvider.of<CategoriesRepository>(context),
              RepositoryProvider.of<NewsRepository>(context)
            )..add(LoadCategories()),
          ),
        ],
        child: ScreenUtilInit(
          designSize: DesignConfig.size,
          allowFontScaling: true,
          builder: () => CupertinoApp(
            title: 'NewsApp',
            localizationsDelegates: _localizationsDelegates(context),
            supportedLocales: EasyLocalization.of(context).supportedLocales,
            locale: EasyLocalization.of(context).locale,
            home: Builder(builder: (context) => TabsScreen()),
          ),
        ),
      ),
    );
  }

  _localizationsDelegates(BuildContext context) => [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ];
}

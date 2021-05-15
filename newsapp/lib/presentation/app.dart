import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/presentation/scenes/main_screen/main_screen.dart';
import 'package:newsapp/presentation/styles/design_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: DesignConfig.size,
      allowFontScaling: true,
      builder: () => CupertinoApp(
        title: 'NewsApp',
        localizationsDelegates: _localizationsDelegates(context),
        supportedLocales: EasyLocalization.of(context).supportedLocales,
        locale: EasyLocalization.of(context).locale,
        home: Builder(builder: (context) => MainScreen()),
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

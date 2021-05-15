import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/presentation/scenes/main_screen/main_screen.dart';
import 'package:newsapp/presentation/styles/design_config.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: DesignConfig.size,
      allowFontScaling: true,
      builder: () => MaterialApp(
        title: 'NewsApp',
        home: Builder(builder: (context) => MainScreen()),
      ),
    );
  }
}

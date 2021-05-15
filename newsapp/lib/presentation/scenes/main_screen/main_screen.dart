import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:newsapp/presentation/scenes/main_screen/local_widgets/articles_list.dart';
import 'package:newsapp/presentation/shared_widgets/article_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Align(
                alignment: Alignment.center,
                child: Container(child: Column(
                  children: [
                    ArticlesList(),
                  ],
                )))));
  }
}

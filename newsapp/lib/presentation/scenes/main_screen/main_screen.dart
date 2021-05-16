import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:newsapp/presentation/helpers/scroll_behavior.dart';
import 'package:newsapp/presentation/scenes/main_screen/local_widgets/articles_list.dart';
import 'package:newsapp/presentation/scenes/main_screen/local_widgets/categories_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/presentation/shared_widgets/neap_appbar.dart';
import 'package:newsapp/presentation/styles/neap_colors.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
            child: Align(
                alignment: Alignment.center,
                child: Container(
                    color: NeapColors.gray,
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        children: [
                          NeapAppBar(label: 'overview'.tr()),
                          ArticlesList(),
                          categoriesHeader(),
                          CategoriesList(),
                          Container(
                            height: 40.h,
                            color: NeapColors.gray,
                          ),
                        ],
                      ),
                    )))));
  }

  Widget categoriesHeader() => Container(
        width: double.infinity,
        height: 40.h,
        decoration: BoxDecoration(
            color: NeapColors.gray,
            border: Border(
                top: BorderSide(color: Colors.grey, width: 0.3),
                bottom: BorderSide(color: Colors.grey, width: 0.3))),
        child: Padding(
          padding: EdgeInsets.only(top: 15.h, left: 15.w),
          child: Text(
            'categories'.tr().toUpperCase(),
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 13.sp),
          ),
        ),
      );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/presentation/helpers/scroll_behavior.dart';
import 'package:newsapp/presentation/scenes/main_screen/local_widgets/categories_list.dart';
import 'package:newsapp/presentation/shared_widgets/article_items_list.dart';
import 'package:newsapp/presentation/shared_widgets/neap_appbar.dart';
import 'package:newsapp/presentation/styles/neap_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class OverviewScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Row(
            children: [
              CupertinoNavigationBarBackButton(
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.black87,
              ),
              Text('Sources')
            ],
          ),
          trailing: CupertinoButton(
            padding: EdgeInsets.only(bottom: 1.h),
            onPressed: () => print('hello'),
              child: Icon(
                CupertinoIcons.compass,
                color: Colors.black87,
                size: 30.sp,

            ),
          ),
        ),
        child: SafeArea(
            child: Align(
                alignment: Alignment.center,
                child: Container(
                    color: Colors.white,
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        children: [
                          header(),
                          Container(
                            height: 20.h,
                            color: Colors.white,
                          ),
                          ArticleItemsList(),
                        ],
                      ),
                    )))));
  }

  Widget header() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Source name here',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.sp)),
            SizedBox(
              height: 30.h,
            ),
            Text(
                'Not so long but also not so short description of given source. Have a nice day!',
                style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 18.sp)),
          ],
        ),
      ),
    );
  }
}

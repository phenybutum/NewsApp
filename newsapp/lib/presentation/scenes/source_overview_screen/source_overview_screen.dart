import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/entities/article/article_model.dart';
import 'package:newsapp/presentation/helpers/scroll_behavior.dart';
import 'package:newsapp/presentation/shared_widgets/article_items_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class SourceOverviewScreen extends StatefulWidget {
  final String sourceTitle;
  final String sourceDescription;
  final List<Article> articles;

  const SourceOverviewScreen(
      {Key key, this.sourceTitle, this.articles, this.sourceDescription})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SourceOverviewScreenState();
}

class _SourceOverviewScreenState extends State<SourceOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          leading: Row(
            children: [
              CupertinoNavigationBarBackButton(
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.black87,
              ),
              Text('sources'.tr()),
            ],
          ),
          trailing: CupertinoButton(
            padding: EdgeInsets.only(bottom: 1.h),
            onPressed: () => print('redirect to browser here'),
            //TODO: 14-implement-open-in-browser-feature
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
            Text(widget.sourceTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.sp)),
            SizedBox(
              height: 30.h,
            ),
            Text(widget.sourceDescription,
                style:
                    TextStyle(fontWeight: FontWeight.normal, fontSize: 18.sp))
          ],
        ),
      ),
    );
  }
}

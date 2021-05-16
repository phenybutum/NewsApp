import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/data/entities/article/article_model.dart';
import 'package:newsapp/presentation/helpers/scroll_behavior.dart';
import 'package:newsapp/presentation/shared_widgets/article_items_list.dart';
import 'package:newsapp/presentation/shared_widgets/neap_appbar.dart';
import 'package:newsapp/presentation/styles/neap_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class CategoryOverviewScreen extends StatefulWidget {

  final String screenTitle;
  final String categoryTitle;
  final List<Article> articles;

  const CategoryOverviewScreen({Key key, this.screenTitle, this.categoryTitle, this.articles}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CategoryOverviewScreenState();
}

class _CategoryOverviewScreenState extends State<CategoryOverviewScreen> {
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
              Text('categories'.tr()),
            ],
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
            Text(widget.categoryTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35.sp)),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
